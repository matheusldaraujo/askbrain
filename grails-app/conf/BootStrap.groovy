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
import gturkplugintester.Demographics
import gturkplugintester.Interests

//This is test application
@Log4j
class BootStrap {

    def mturkTaskService
    def askBrainWorkflowService


    def init = { servletContext ->
        //Auto login as matheus
        new Credentials(["name":"matheus","awsId":"AKIAIBUJ2GWH7GCFPF4A","awsSecret":"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"]).save()
        askBrainWorkflowService.createAskWorkflow()
        askBrainWorkflowService.createTurkerMixerWorkflow()
        askBrainWorkflowService.createTurkerRankerWorkflow()
    }

def destroy = {
}
}
