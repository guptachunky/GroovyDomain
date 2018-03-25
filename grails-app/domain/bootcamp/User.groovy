package bootcamp

import com.mysql.jdbc.Blob


class User {

    String firstName
    String lastName
    String emailId
    String password
    String userName
    byte[] photo
    Date dateCreated
    Date dateUpdated
    Boolean admin
    Boolean active

//    static hasMany = [topic:Topic]
//    static hasMany=[subscription:Subscription]
    static constraints = {

        emailId(unique: true, email: true, blank: false)
        userName(blank: false)
        lastName(nullable: false, blank: false)
        firstName(nullable: false, blank: false)
        password(nullable: false)
        userName(nullable: true, unique: true)
        photo(nullable: true,)
        dateCreated(nullable: true)
        admin(nullable: true)
        active(nullable: true)
        dateUpdated(nullable: true)


    }
}
