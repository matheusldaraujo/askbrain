package askbrain

import edu.msu.mi.gwurk.Credentials
import edu.msu.mi.gwurk.Workflow
import grails.transaction.Transactional


class ClientController {
    def mturkMonitorService

    def index() {}

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

    def signup(){}

    def login(){}

    def loading() {}
}