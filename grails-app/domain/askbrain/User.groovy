package askbrain

class User {
    String firstName;
    String lastName;
    String middleInitial;
    String userName;
    String pw; // Password
    String userEmail;

    static constraints = {
        //firstName  Nullable : false
        //lastName Nullable : false
        //middleInitial Nullable : true
        //userName nullable : false
        //email Nullable : false
    }
}
