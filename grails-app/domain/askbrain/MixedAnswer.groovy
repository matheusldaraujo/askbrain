package askbrain

class MixedAnswer {

    static constraints = {
//        TODO: Increase Answer space, not just varchar(255)
    }

    int rankValue = 0;
    String mixedAnswer;
    String additionalAnswer;

    static belongsTo = [question:Question];

    public def saveMixedAnswerFromTurk(LinkedHashMap turkerAnswer){
        print "Saving Mixed Answer"
        def question = Question.get(turkerAnswer.question_id)
        this.setQuestion(question)
        this.setAdditionalAnswer(turkerAnswer.additionalAnswer)
        this.setMixedAnswer(turkerAnswer.mixedAnswer)

        question.setMixed(true)
        this.save()
    }
}
