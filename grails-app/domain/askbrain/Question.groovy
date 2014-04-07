package askbrain

class Question {

    static constraints = {
//        TODO: Increase Question space, not just varchar(255)
        bestMixedAnswer nullable: true
    }

    static hasMany = [answers:Answer, mixedAnswers:MixedAnswer]

    String question
    Boolean answered = false
    Boolean mixed = false
    Boolean graded = false
    Boolean finalized = false
    MixedAnswer bestMixedAnswer;

    public def chooseBestAnswer(){
        def toChooseAnswer = null
        def maxAvg = 0
        mixedAnswers.each { mixedAnswer ->
            def average = mixedAnswer.gradeValue.sum()/mixedAnswer.gradeValue.size()
            if( average > maxAvg){
                maxAvg = average
                toChooseAnswer = mixedAnswer
            }

        this.setBestMixedAnswer(toChooseAnswer);
        this.setFinalized(true)
        }
    }
}
