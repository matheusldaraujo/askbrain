package askbrain

import edu.msu.mi.gwurk.Credentials
import edu.msu.mi.gwurk.Workflow
import grails.transaction.Transactional

@Transactional
class AskBrainWorkflowService {
    def mturkMonitorService

    Integer simpleAnswers = 1
    Integer mixedAnswers = 1
    Integer rankedMixedAnswers = 1

    def throwTurkerMixerHits(turkerAnswer){
        //       Steps to Lunch Hits
        print "Throwing mixer hits"
        def w = Workflow.findByName('Turker Mixer Workflow')
        println("Turker Answer: \"$turkerAnswer.answer\"")
        println(Workflow.list())
        mturkMonitorService.launch(w,turkerAnswer.type=="real",turkerAnswer.iterations as int,Credentials.get(turkerAnswer.credentials as long), turkerAnswer.props as Map)
    }

    def throwTurkerRankerHits(turkerAnswer){
        //       Steps to Lunch Hits
        print "Throwing ranker hits"
        def w = Workflow.findByName('Turker Ranker Workflow')
        println("Turker Answer: \"$turkerAnswer.mixedAnswer\"")
        println(Workflow.list())
        mturkMonitorService.launch(w,turkerAnswer.type=="real",turkerAnswer.iterations as int,Credentials.get(turkerAnswer.credentials as long), turkerAnswer.props as Map)
    }
}
