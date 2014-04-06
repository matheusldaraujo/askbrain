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
    Boolean ranked = false
    Boolean finalized = false
    MixedAnswer bestMixedAnswer;

    public def chooseBestAnswer(){
        def toChooseAnswer = null
        def maxAvg = 0
        mixedAnswers.each { mixedAnswer ->
            def average = mixedAnswer.rankValue.sum()/mixedAnswer.rankValue.size()
            if( average > maxAvg){
                maxAvg = average
                toChooseAnswer = mixedAnswer
            }

        this.setBestMixedAnswer(toChooseAnswer);
        this.setFinalized(true)
        }
    }
}
