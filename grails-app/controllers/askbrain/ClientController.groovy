package askbrain

import edu.msu.mi.gwurk.Credentials
import edu.msu.mi.gwurk.Workflow
import grails.transaction.Transactional


class ClientController {
    def mturkMonitorService

    def index() {
        if(params.isLoggedIn == null){
            redirect(action:"index", params:['isLoggedIn':0])
        }
        if (params.isLoggedIn == 1){
            def user = User.load(params.id)
            [user:user]
        }
    }

    @Transactional
    def begin_question() {
//        Save question
        def q = new Question()
        q.setQuestion(params.question)
        if (params.isLoggedIn){
            println "Here"
            def user = User.load(params.id)
            q.setUser(user)
            user.question.add(q)
            user.save()
        }
        if (!q.save()) {
            q.errors.each {
                println it
            }
        }

//       Steps to Lunch Hits
        def w = Workflow.findByName("Question Workflow")
        println("Client question: \"$params.question\"")
        println(Workflow.list())
        mturkMonitorService.launch(w,params.type=="real",params.iterations as int,Credentials.get(params.credentials as long), params.props as Map)
        redirect(action: "loading", params: ['isLoggedIn':params.isLoggedIn, 'id':params.id])
    }

    def signup() {}

    def login() {}

    def loading() {}

    def validateCredentials(){
       User.load()
       println (params.pw == "")
       println (params.userName == "")

       if ((params.pw).toString() == "" || (params.userName).toString() == ""){
           render(view:"login")
       } else {

           def user1Pw = User.executeQuery("SELECT u.pw FROM User u WHERE u.userName = '${params.userName}'")

           if (user1Pw == []) {
               render(view:"login")
           } else if (user1Pw[0] == params.pw){
               def user1Id = User.executeQuery("SELECT u.id FROM User u WHERE u.userName = '${params.userName}'")

               def user = User.load(user1Id[0])
               user.isLoggedIn = 1
               user.save()
               redirect(action:"index", params:['id':user1Id[0], 'isLoggedIn': 1])
           } else {
               render(view:"login")
           }
       }
    }

    def createUser(){
        def user = new User(params)
        params.userName = (params.userName.toString()).trim()
        params.firstName = (params.firstName.toString()).trim()
        params.middleInitial = (params.middleInitial.toString()).trim()
        params.lastName = (params.lastName.toString()).trim()
        params.userEmail = (params.userEmail.toString()).trim()

        if(user.save()){
            redirect(action:"login")
        } else {
            render(view:"signup")
        }
    }

    def userProfile(){
        println "Params: " + params
        def user = User.load(params.id)
        [user:user]
    }

    def logoutUser(){
        def user = User.load(params.id)
        user.isLoggedIn = 0
        user.save()
        redirect (action:"index", params:['isLoggedIn',0])
    }

    def checkIfAnswered(){
        def q = Question.load(params.qid) // The id of the question

        if (q.answered){
            redirect(action:"display", params:['id':params.id, 'isLoggedIn': params.isLoggedIn])
        } else {
            redirect(action:"loading", params:['id':params.id, 'isLoggedIn': params.isLoggedIn])
        }
    }
}