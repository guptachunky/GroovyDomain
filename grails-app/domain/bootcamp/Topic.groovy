package bootcamp

import constant.Seriousness
import constant.Visibility

class Topic {

    String name
    static belongsTo = [createdBy: User]
    Date dateCreated
    Date lastUpdated

    static hasMany = [subscriptions: Subscription, resources: Resource]
    Visibility visibility

    static constraints = {

        name(unique: 'createdBy', blank: false, nullable: false)
        visibility(nullable: true)
        createdBy(nullable: false)

    }

    def afterInsert() {
        Topic.withNewSession {
            Subscription subscription = new Subscription()
            subscription.setTopic("topic name")
            subscription.setSeriousness(Seriousness.Casual)

            userInvitation.save()
        }
    }
}
