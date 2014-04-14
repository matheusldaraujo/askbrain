package askbrain

class User {
    String firstName
    String lastName
    String middleInitial
    String userName
    String pw // Password
    String userEmail

    static hasMany = [question:Question]

    static constraints = {
        firstName blank:false
        lastName blank:false
        middleInitial size: 0..1, blank:true
        userName blank:false
        userEmail blank:false, matches: /.+\@.+\..+/
        pw blank:false
    }
}
