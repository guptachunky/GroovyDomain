package bootcamp

import commandobject.SearchCO

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
    String confirmPassword
    static transients = ['confirmPassword', 'subscribedTopics']

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
//        confirmPassword(blank: false, validator: { password, obj ->
//            def password2 = obj.password
//            password == password2 ? true : ['invalid.matchingpasswords']
//
//        })


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

    List getUnreadResource(SearchCO searchCO) {

        if (searchCO.q) {
            List<ReadingItem> unReadItems = ReadingItem.createCriteria().list(max: 10, offset: 0) {
                ilike('resource.description', this.resources.description)
                eq('isRead', false)
            }
            return unReadItems
        }
    }


    List<String> getSubscribedTopics() {
        List<String> subscribedTopics = []
        subscribedTopics = this.subscriptions.each {
            it.topic.name
        }
    }


}
