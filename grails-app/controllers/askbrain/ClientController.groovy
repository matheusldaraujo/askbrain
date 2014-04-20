package askbrain

import edu.msu.mi.gwurk.Credentials
import edu.msu.mi.gwurk.Workflow
import grails.transaction.Transactional


class ClientController {
    def mturkMonitorService

    def index() {
        def user = session.getAttribute("user")
        if(user){
            [user:user]
        }
        else{
            [user:null]
        }
    }

    @Transactional
    def begin_question() {
//        Save question
        def q = new Question()
        q.setQuestion(params.question)
        if (params.isLoggedIn){
            println "Here"
            def user = User.get(1)
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
       def user = User.findByUserNameAndPw(params.userName, params.pw)
       if(user){
           session.user = user
           redirect(action:"index")
       }
       else{
           render(view:"login")
       }
//       if ((params.pw).toString() == "" || (params.userName).toString() == ""){
//           render(view:"login")
//       } else {
//
//           def user1Pw = User.executeQuery("SELECT u.pw FROM User u WHERE u.userName = '${params.userName}'")
//
//           if (user1Pw == []) {
//               render(view:"login")
//           } else if (user1Pw[0] == params.pw){
//               def user1Id = User.executeQuery("SELECT u.id FROM User u WHERE u.userName = '${params.userName}'")
//
//               def user = User.load(user1Id[0])
//               user.isLoggedIn = 1
//               user.save()
//               redirect(action:"index", params:['id':user1Id[0], 'isLoggedIn': 1])
//           } else {
//               render(view:"login")
//           }
//       }
    }

    def createUser(){
        def user = new User()
        user.setFirstName("a")
        user.setLastName("a")
        user.setMiddleInitial("a")
        user.setUserName("a")
        user.setPw ("a")
        user.setConPw("a")
        user.setUserEmail("casa@casa.com")


        if(user.save()){
            print "teste"
            redirect(action:"login")
        } else {
            print "testeteste"
            render(view:"signup")
        }
    }

    def userProfile(){
        //Make the redundancy, so the IDE nows that session.user is a User
        def user = User.get(session.user.getId())

        [user:user,question:user.getQuestion()]
    }

    def logoutUser(){
        //TODO: make session.invalidate() works
        session.user = null
        redirect (action:"index")
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