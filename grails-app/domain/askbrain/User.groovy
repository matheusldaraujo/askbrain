package askbrain

class User {
    String firstName
    String lastName
//    String middleInitial
    String userName
    String pw // Password
//    String userEmail

    static hasMany = [question:Question]
    static constraints = {
//        firstName blank:true, nullable: true
//        lastName blank:false, nullable: true
//        middleInitial size: 0..1, blank:true, nullable: true
//        userName blank:false, unique: true
//        userEmail blank:false, matches: /.+\@.+\..+/, nullable: true
//        pw blank:false
        }
    }

