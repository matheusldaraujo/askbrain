package askbrain

class User {
    String firstName
    String lastName
    String middleInitial
    String userName
    String pw // Password
    String conPw // Password Confirmation
    String userEmail
    int isLoggedIn = 0 // Determines if the user is logged in or not

    static hasMany = [question:Question]

    static constraints = {
        firstName blank:true
        lastName blank:false, nullable: true
        middleInitial size: 0..1, blank:true, nullable: true
        userName blank:false, unique: true
        userEmail blank:false, matches: /.+\@.+\..+/
        pw blank:false
        isLoggedIn blank:false
        conPw validator: { val, obj ->
            if (obj.pw != obj.conPw){
                return "Passwords do not match."
            }
        }
    }
}
