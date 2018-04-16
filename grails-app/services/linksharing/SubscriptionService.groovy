package linksharing

import bootcamp.Subscription
import bootcamp.Topic
import commandobject.TopicSearchCO
import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }

    def changeSeriousness(Map subscriptionData) {
        Subscription subscription = Subscription.findById(subscriptionData.id)
        subscription.seriousness = subscriptionData.seriousness
        if (subscription.save(flush: true)) {
            log.info("Seriousness Changed : $subscription")
            return true
        } else {
            log.error("Unable to Change Seriousness : $subscription")
            subscription.errors.allErrors.each { println it }
            return false
        }
    }

    def subscribeThroughEmail(String topicName) {
        Topic inviteTopic = Topic.findByName(topicName)
        Subscription subscription = new Subscription(user: session.user, topic: inviteTopic, seriousness: Seriousness.SERIOUS)
        if (subscription.save(flush: true)) {
            log.info("Subscription added Successfully")
            return true
        } else {
            log.error("Unable to add Subscription")
            subscription.errors.allErrors.each { println it }
            return false
        }
    }
}
