package bootcamp

import constant.Seriousness

class Subscription {

    Seriousness seriousness
    Date dateCreated
    Date dateUpdated

    static belongsTo = [user: User, topic: Topic]
    static constraints = {
        user(nullable: false, unique: 'user')
        topic(nullable: false, unique: 'user')
        seriousness(nullable: false)
    }
}
