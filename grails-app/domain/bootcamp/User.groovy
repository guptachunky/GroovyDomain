package bootcamp

import com.sun.org.apache.xpath.internal.operations.Bool
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

    }
    static constraints = {

        emailId(unique: true, email: true, blank: false)
        userName(blank: false, nullable: false)
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
    }

    def beforeInsert() {
    }

    def beforeValidate() {

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


    List<String> getUserTopics() {
        List<String> userTopics = []
        if (this.topics) {
            this.topics.each {
                userTopics.add(it.name)
            }
        }
        return userTopics
    }


    List<Topic> getSubscribedTopics() {
        List<Topic> subscribedTopics = []
        subscriptions.each {
            if (!(it.topic.createdBy == it.user)) {
                subscribedTopics.add(it.topic)
            }
        }
        return subscribedTopics
    }


    Integer getSubscriptionCount() {

        this.subscriptions.count()
    }


    Boolean canDeleteResource(Resource resource) {

        if (this.admin) {
            return true
        } else if (resource.user == this) {
            true
        } else {
            return false
        }
    }


    Integer getScore(Resource resource) {
        RatingResource ratingResource = RatingResource.findByUserAndResource(this, resource: resource)
        return ratingResource.score
    }


    static Boolean isSubscribed(Topic topic) {
        List<User> userList = []
        userList = Subscription.createCriteria().list {
            projections {
                property("user")
            }

            eq("topic", topic)
        }


        if (userList.contains(this)) {
            true
        } else
            false
    }


}
