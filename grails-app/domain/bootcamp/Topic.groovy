package bootcamp

import constant.Seriousness
import constant.Visibility

class Topic {

    String name
    static belongsTo = [createdBy: User]
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static hasMany = [subscriptions: Subscription, resources: Resource]

    static constraints = {

        name(blank: false, nullable: false, unique: "createdBy")
        visibility(nullable: false)
    }

    def afterInsert() {
        Topic.withNewSession {

            println(this.name)
            Subscription subscription = new Subscription()
            subscription.setTopic(this)
            subscription.setUser(this.createdBy)
            subscription.setSeriousness(Seriousness.Casual)
            if (subscription.save(flush: true)) {
                log.info "Subscription ${subscription} saved successfully"
            } else {
                log.error "Error saving subscription : ${subscription.errors.allErrors}"
            }

        }
    }

    @Override
    String toString() {
        return "Topic{" +
                "name='" + name + '\'' +
                '}'
    }
}
