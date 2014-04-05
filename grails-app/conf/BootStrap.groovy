import askbrain.Answer
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
    def mturkMonitorService

    def init = { servletContext ->
        createAskWorkflow()
        createTurkerMixerWorkflow()
    }

    def createAskWorkflow(){
        Workflow ask_workflow = new Workflow("Question Workflow", "Ask turkers simple questions", [
                //                TODO: Review and fill a good set for askbrain
                rewardAmount: 0.03f,
                relaunchInterval: 1000 * 60 * 60,
                autoApprove: true,
                lifetime: 60 * 60 * 10,
                assignmentDuration: 60,
                keywords: "survey, demographics, research",
                maxAssignments: 1,
                height: 1000,
                requireApproval: false
        ])

        Task question_task = new SingleHitTask("FistQuestionTask", [
                controller: "turker",
                action: "createAskHit",
                title: "Answer one question in a paragraph",
                description: "This a survey you need to simply answer a question in a paragraph.",
        ]).save()

        ask_workflow.initStartingTasks(question_task)
        ask_workflow.save()

        mturkTaskService.installTask(question_task) { type, GwurkEvent evt ->
            switch (type) {

                case GwurkEvent.Type.HIT_COMPLETE:
                    log.info("Hit complete!")
                    println "Question Task: Hit Complete"
                    break
                case GwurkEvent.Type.ASSIGNMENT_COMPLETE:
                    log.info("Assignment complete!")
                    println "Question Task: Assigment Complete"
                    def turkerAnswer = evt.assignmentView.answer
                    println evt.assignmentView.answer

                    print "Saving Answer"
                    def ans = new Answer()
                    ans.saveAnswerFromTurk(turkerAnswer)

                    throwTurkerMixerHits(evt.assignmentView.answer)

                    break

                case GwurkEvent.Type.TASK_COMPLETE:
                    log.info("Task complete!")
                    println "Question Task: Task Complete"
                    break
            }

        }
        mturkTaskService.installWorkflow(ask_workflow) { a,b->
            log.info("Workflow complete!")
        }
    }

    def createTurkerMixerWorkflow(){
        Workflow mixer_workflow = new Workflow("Turker Mixer Workflow", "Ask turkers simple questions", [
                //                TODO: Review and fill a good set for askbrain
                rewardAmount: 0.03f,
                relaunchInterval: 1000 * 60 * 60,
                autoApprove: true,
                lifetime: 60 * 60 * 10,
                assignmentDuration: 60,
                keywords: "survey, demographics, research",
                maxAssignments: 1,
                height: 1000,
                requireApproval: false
        ])

        Task mixer_task = new SingleHitTask("MixerTask", [
                controller: "turker",
                action: "createMixerHit",
                title: "Answer a question and join it with 3 sentences creating a paragraph",
                description: "This a survey you need to simply answer a question in a paragraph.",
        ]).save()

        mixer_workflow.initStartingTasks(mixer_task)
        mixer_workflow.save()

        mturkTaskService.installTask(mixer_task) { type, GwurkEvent evt ->
            switch (type) {

                case GwurkEvent.Type.HIT_COMPLETE:
                    log.info("Hit complete!")
                    println "Mixer Task: Hit Complete"
                    break
                case GwurkEvent.Type.ASSIGNMENT_COMPLETE:
                    log.info("Assignment complete!")
                    println "Mixer Task:Assigment Complete"
                    def turkerAnswer = evt.assignmentView.answer
                    println evt.assignmentView.answer

                    print "Saving Answer"
                    def ans = new Answer()
                    ans.saveAnswerFromTurk(turkerAnswer)


                    break

                case GwurkEvent.Type.TASK_COMPLETE:
                    log.info("Task complete!")
                    println "Mixer Task:Task Complete"
                    break
            }

        }
        mturkTaskService.installWorkflow(mixer_workflow) { a,b->
            log.info("Workflow complete!")
        }
    }

    def throwTurkerMixerHits(turkerAnswer){
        //       Steps to Lunch Hits
        print "Throwing mixer Hits"
        def w = Workflow.findByName('Turker Mixer Workflow')
        println("Client question: \"$turkerAnswer.answer\"")
        println(Workflow.list())
        mturkMonitorService.launch(w,turkerAnswer.type=="real",turkerAnswer.iterations as int,Credentials.get(turkerAnswer.credentials as long), turkerAnswer.props as Map)
    }

    def destroy = {
    }
}
