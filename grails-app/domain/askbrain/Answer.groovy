package askbrain

class Answer {

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
        question.setAnswered(true)
        this.save()
    }
}
