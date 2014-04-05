package askbrain

class Question {

    static constraints = {
    }

    static hasMany = [answers:Answer]
    String question
    Boolean answered = false
    Boolean mixed = false
    Boolean ranked = false
    Boolean finalized = false
}
