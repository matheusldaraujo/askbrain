package askbrain

import edu.msu.mi.turkmdr.Credentials
import edu.msu.mi.turkmdr.Workflow


class ClientInteractionController {
    def mturkMonitorService

    def index() {}
    def begin_question() {
        def w = Workflow.first()

        println("Client question: \"$params.question\"")

        println(Workflow.list())

        mturkMonitorService.launch(w,params.type=="real",params.iterations as int,Credentials.get(params.credentials as long), params.props as Map)
        redirect(action: "loading")
    }

    def loading() {}
}
