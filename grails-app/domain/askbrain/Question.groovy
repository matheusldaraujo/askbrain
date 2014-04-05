package askbrain

class Question {

    static constraints = {
//        TODO: Increase Question space, not just varchar(255)
    }

    static hasMany = [answers:Answer, mixedAnswers:MixedAnswer]

    String question
    Boolean answered = false
    Boolean mixed = false
    Boolean ranked = false
    Boolean finalized = false
}
