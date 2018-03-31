package bootcamp

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

    static hasMany = [topics: Topic, subscriptions: Subscription, resources: Resource, ratingResource: RatingResource, readingItem: ReadingItem]

    static mapping = {
        sort "firstName"
//        sort("id": "desc")
    }
    static constraints = {

        emailId(unique: true, email: true, blank: false)
        userName(blank: false)
        lastName(nullable: false, blank: false)
        firstName(nullable: false, blank: false)
        password(nullable: false)
        userName(nullable: true, unique: true)
        photo(nullable: true, sqlType: 'longBlob')
        dateCreated(nullable: true)
        admin(nullable: true)
        active(nullable: true)
        dateUpdated(nullable: true)


    }


    def afterInsert() {
//        log.info "----------Into After Insert------"
    }

    def beforeInsert() {
//        log.info "----------Into before Insert------"
    }

    def beforeValidate() {

//        Ques fourth
//        if (User.count() == 0) {
//            return true
//        } else {
//            return false
//        }

    }


    @Override
    String toString() {
        return "User = ${userName}"
    }


}
