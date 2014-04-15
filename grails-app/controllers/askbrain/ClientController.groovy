package askbrain

import edu.msu.mi.gwurk.Credentials
import edu.msu.mi.gwurk.Workflow
import grails.transaction.Transactional


class ClientController {
    def mturkMonitorService

    def index() {
        println"P: " + params
        println "Params.isLoggedIn: ${params.isLoggedIn}"
        if(params.isLoggedIn == null){
            redirect(action:"index", params:['isLoggedIn':0])
        }
        if (params.isLoggedIn == 1){
            println "params.id: " + params.id
            def user = User.load(params.id)
            [user:user]
        }
    }

    @Transactional
    def begin_question() {
//        Save question
        def q = new Question()
        q.setQuestion(params.question)
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
        redirect(action: "loading")
    }

    def signup() {}

    def login() {}

    def loading() {}

    def validateCredentials(){
       User.load()
       println (params.pw == "")
       println (params.userName == "")

       if ((params.pw).toString() == "" || (params.userName).toString() == ""){
           println "Both are empty"
           render(view:"login")
       } else {

           def user1Pw = User.executeQuery("SELECT u.pw FROM User u WHERE u.userName = '${params.userName}'")

           if (user1Pw == []) {
               println "No Match"
               render(view:"login")
           } else if (user1Pw[0] == params.pw){
               println "logged in"
               def user1Id = User.executeQuery("SELECT u.id FROM User u WHERE u.userName = '${params.userName}'")

               def user = User.load(user1Id[0])
               user.isLoggedIn = 1
               user.save()
               redirect(action:"index", params:['id':user1Id[0], 'isLoggedIn': 1])
           } else {
               println "Passwords don't match"
               render(view:"login")
           }
       }
    }

    def createUser(){
        def user = new User(params)
        println "Params1: " + params
        params.userName = (params.userName.toString()).trim()
        params.firstName = (params.firstName.toString()).trim()
        params.middleInitial = (params.middleInitial.toString()).trim()
        params.lastName = (params.lastName.toString()).trim()
        params.userEmail = (params.userEmail.toString()).trim()

        println "Params1: " + params
        if(user.save()){
            println "Saved User"
            redirect(action:"login")
        } else {
            println "Didnt Save User"
            render(view:"signup")
        }
    }

    def userProfile(){
        def user = User.load(params.id)
        [user:user]
    }

    def logoutUser(){
        println "Params4: " + params
        def user = User.load(params.id)
        user.isLoggedIn = 0
        user.save()
        println "Logged Out"
        redirect (action:"index", params:['isLoggedIn',0])
    }
}