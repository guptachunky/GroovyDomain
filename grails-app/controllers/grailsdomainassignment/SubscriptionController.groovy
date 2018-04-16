package grailsdomainassignment

import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User
import constant.Seriousness
import grails.converters.JSON
import linksharing.SubscriptionService

class SubscriptionController {

    SubscriptionService subscriptionService

    def index() {}

    def save(Integer id) {

        Topic topic = Topic.get(id)
        Subscription subscription = new Subscription(user: session.user, topic: topic)
        if (subscription.save())
            render("success")
        else
            render("error")
    }

    def delete(Integer id) {
        Subscription subscription = Subscription.get(id)
        if (subscription) {
            render Subscription.deleteAll(subscription) as JSON
        } else {
            render("Error")
        }

    }

    def update(Integer id, String seriousness) {
        Seriousness seriousness1 = Seriousness.stringSeriousness(seriousness)
        Subscription subscription = Subscription.findById(id)
        subscription.seriousness = seriousness1
        if (subscription != null) {
            if (subscription.save(flush: true) as JSON)
                render("success")
            else
                render("failure")
        } else
            render("not found")
    }


    def changeSeriousness() {
        if (subscriptionService.changeSeriousness(params)) {
            flash.message = "Updated"
        } else {
            flash.error = "Unable to Update"
        }
        redirect(controller: 'user', action: 'editProfile')
    }


    def changeSubscription() {
        Topic topic = Topic.get(params.id)
        Subscription subscription = Subscription.findByTopicAndUser(topic, session.user)

        subscription.delete(flush: true)
        redirect(controller: 'user', action: 'index')

    }

    def subscribeThroughEmail() {
        if (subscriptionService.subscribeThroughEmail(params.id)) {
            flash.message = "subscription done"
        } else
            flash.error = "not able to subscribe"
    }

}


