import edu.msu.mi.turkmdr.AssignmentView
import edu.msu.mi.turkmdr.GwurkEvent
import edu.msu.mi.turkmdr.GwurkEvent
import edu.msu.mi.turkmdr.HitView
import edu.msu.mi.turkmdr.SingleHitTask
import edu.msu.mi.turkmdr.Task
import edu.msu.mi.turkmdr.TaskRun
import edu.msu.mi.turkmdr.Workflow
import edu.msu.mi.turkmdr.WorkflowRun
import groovy.util.logging.Log4j
import gturkplugintester.Demographics
import gturkplugintester.Interests

//This is test application
@Log4j
class BootStrap {

    def mturkTaskService

    def init = { servletContext ->

        Workflow w = new Workflow("Ask Brain workflow", "Ask turkers simple questions", [
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

        Task one = new SingleHitTask("FistQuestionTask", [
                controller: "turker",
                action: "create",
                title: "Answer one question in a paragraph",
                description: "This a survey you need to simply answer a question in a paragraph.",
        ]).save()

//        Task three = new SingleHitTask("DemographicsTask", [
//                controller: "demographics",
//                action: "create",
//                title: "Enter some demographic information",
//                description: "This a survey to understand the turker workforce a little better. No identifying information will be captured, and the data is for research purposes only",
//        ]).save()

//        Task two = new SingleHitTask("InterestsTask", [
//                controller: "interests",
//                action: "create",
//                title: "Enter some information about yourself",
//                description: "This a survey to understand the turker workforce a little better. No identifying information will be captured, and the data is for research purposes only",
//                ]).save()
//        one.addToNext(two)
//        one.save()
        w.initStartingTasks(one)
        w.save()

        mturkTaskService.installTask(one) { type, GwurkEvent evt ->
            switch (type) {

                case GwurkEvent.Type.HIT_COMPLETE:
                    log.info("Hit complete!")
                    break
                case GwurkEvent.Type.ASSIGNMENT_COMPLETE:
                    log.info("Assignment complete!")
                    println evt.assignmentView.answer
                    new Demographics(evt.assignmentView.answer).save()
                    break

                case GwurkEvent.Type.TASK_COMPLETE:
                    log.info("Task complete!")
                    break
            }

        }

//        mturkTaskService.installTask(two) { type, GwurkEvent evt ->
//            switch (type) {
//
//                case GwurkEvent.Type.HIT_COMPLETE:
//                    log.info("Hit complete!")
//                    break
//
//                case GwurkEvent.Type.ASSIGNMENT_COMPLETE:
//                    log.info("Assignment complete!")
//                    println evt.assignmentView.answer
//                    new Interests(evt.assignmentView.answer).save()
//                    break
//
//                case GwurkEvent.Type.TASK_COMPLETE:
//                    log.info("Task complete!")
//                    break
//            }
//
//        }




        mturkTaskService.installWorkflow(w) { a,b->
            log.info("Workflow complete!")
        }

    }
    def destroy = {
    }
}
