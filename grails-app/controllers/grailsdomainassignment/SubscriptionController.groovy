package grailsdomainassignment

import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User
import constant.Seriousness

class SubscriptionController {

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
            Subscription.deleteAll(subscription)
            render("Success")
        } else {
            render("Error")
        }

    }

    def update(Integer id, String seriousness) {
        Seriousness seriousness1 = Seriousness.stringSeriousness(seriousness)
        Subscription subscription = Subscription.findByIdAndSeriousness(id, seriousness1)
        if (subscription != null) {
            if (subscription.save(flush: true))
                render("success")
            else
                render("failure")
        } else
            render("not found")
    }

}


