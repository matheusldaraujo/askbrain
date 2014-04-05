package askbrain

class Answer {

    static constraints = {

    }

    String answer;
    static belongsTo = [ question:Question];

    public def saveAnswerFromTurk(LinkedHashMap turkerAnswer){
        def question = Question.get(turkerAnswer.question_id)
        this.setQuestion(question)
        this.setAnswer(turkerAnswer.answer)
        question.setAnswered(true)
        this.save()
    }
}
