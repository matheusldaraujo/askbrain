import askbrain.Answer
import askbrain.AskBrainMonitorService
import askbrain.MixedAnswer
import askbrain.Question
import edu.msu.mi.gwurk.AssignmentView
import edu.msu.mi.gwurk.Credentials
import edu.msu.mi.gwurk.GwurkEvent
import edu.msu.mi.gwurk.GwurkEvent
import edu.msu.mi.gwurk.HitView
import edu.msu.mi.gwurk.SingleHitTask
import edu.msu.mi.gwurk.Task
import edu.msu.mi.gwurk.TaskRun
import edu.msu.mi.gwurk.Workflow
import edu.msu.mi.gwurk.WorkflowRun
import groovy.util.logging.Log4j
import askbrain.User
import gturkplugintester.Demographics
import gturkplugintester.Interests

//This is test application
@Log4j
class BootStrap {

    def mturkTaskService
    def askBrainWorkflowService


    def init = { servletContext ->
        //Auto login as matheus
        new Credentials(["name":"joe","awsId":"AKIAJTWL3OQ3G3V4ILFQ","awsSecret":"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"]).save()
        askBrainWorkflowService.createAskWorkflow()
        askBrainWorkflowService.createTurkerMixerWorkflow()
        askBrainWorkflowService.createTurkerRankerWorkflow()

        //Create Test user
        new User(["firstName":"fn","lastName":"ln","middleInitial":"mi","userName":"un","pw":"pw","conPw":"pw","userEmail":"a@a.com"]).save()
    }

def destroy = {
}
}
