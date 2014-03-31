package edu.msu.mi.turkmdr

class WorkflowController {

    def mturkMonitorService

    def index() {}

    def launchWorkflow() {
        if (params.workflow) {
            flash.workflow = Workflow.get(params.workflow)

        } else {
            render(view:"index")
        }

    }

    def doLaunch() {
        Workflow w = flash.workflow
        println(params)
        mturkMonitorService.launch(w,params.type=="real",params.iterations as int,Credentials.get(params.credentials as long), params.props as Map)
        redirect(action:"index",controller:"workflowRun")
    }

    def external() {
        print("--------------------------------")

        TaskRun run = TaskRun.get(params.task as long)
        print run
        print run.taskProperties.action
        print run.taskProperties.controller
        print run.submitUrl
        print params.workerId
        print("--------------------------------")
        [workerId: params.workerId, action: run.taskProperties.action,controller: run.taskProperties.controller, submiturl: run.submitUrl, assignmentId: params.assignmentId]

    }


}
