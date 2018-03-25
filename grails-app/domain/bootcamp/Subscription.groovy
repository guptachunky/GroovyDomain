package bootcamp

import constant.Seriousness

class Subscription {

    Topic topic
//    static belongsTo = [user:User]
    Seriousness seriousness
    Date dateCreated
    Date dateUpdated

    static constraints = {
        user(nullable: false)
        topic(nullable: false)
        seriousness(nullable: false)
    }
}
