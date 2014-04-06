package askbrain

class Answer {
    def askBrainWorkflowService

    static constraints = {
//        TODO: Increase Answer space, not just varchar(255)
    }

    String answer;
    static belongsTo = [ question:Question];

    public def saveAnswerFromTurk(LinkedHashMap turkerAnswer){
        print "Saving Answer"
        def question = Question.get(turkerAnswer.question_id)
        this.setQuestion(question)
        this.setAnswer(turkerAnswer.answer)
        this.save()

        if (question.getAnswers().size() == askBrainWorkflowService.simpleAnswers){
            print "Question: '" + question.getQuestion() + "' answered!"
            question.setAnswered(true)

            askBrainWorkflowService.throwTurkerMixerHits(turkerAnswer)
        }

    }
}
