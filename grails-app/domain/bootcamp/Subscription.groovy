package bootcamp

import constant.Seriousness


class Subscription {

    Seriousness seriousness
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User, topic: Topic]
    static constraints = {
        user(nullable: false)
        topic(nullable: false, unique: "user")
        seriousness(nullable: false)
    }
}
