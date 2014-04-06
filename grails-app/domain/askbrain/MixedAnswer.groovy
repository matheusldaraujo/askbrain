package askbrain

class MixedAnswer {

    def askBrainWorkflowService

    static constraints = {
//        TODO: Increase Answer space, not just varchar(255)
    }

    static hasMany = [rankValue: Integer]
    String mixedAnswer;
    String additionalAnswer;
    Boolean ranked = false;

    static belongsTo = [question:Question];

    public def saveMixedAnswerFromTurk(LinkedHashMap turkerAnswer){
        print "Saving Mixed Answer"
        def question = Question.get(turkerAnswer.question_id)
        this.setQuestion(question)
        this.setAdditionalAnswer(turkerAnswer.additionalAnswer)
        this.setMixedAnswer(turkerAnswer.mixedAnswer)
        this.save()

        if (question.getMixedAnswers().size() == askBrainWorkflowService.mixedAnswers){
            askBrainWorkflowService.throwTurkerRankerHits(turkerAnswer)
            question.setMixed(true)
        }



    }
}
