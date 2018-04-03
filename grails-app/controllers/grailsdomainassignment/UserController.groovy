package grailsdomainassignment

import bootcamp.Subscription
import bootcamp.Topic
import constant.Visibility


class UserController {

    def index() {
//        redirect(controller: 'topic', action: 'index')
//        //render(text: "${session.user.userName}")
    }


    def register() {

    }

    def show(Integer id) {
//        render(text: "${params.id}")
        Integer myId = (Integer) params.id
        Topic topic = Topic.get(myId)
        if (!topic) {
            flash.error = "Topic Not Found"
            redirect(controller: "login", action: "index")
        } else {
            if (topic.visibility == Visibility.Public) {

                render(text: "Success")
            } else {
                Subscription subscription = Subscription.findByUserAndTopic(session.user, topic)
                if (subscription) {
                    render(text: "Success")
                } else {
                    flash.error = "Subscription Not found"
                    redirect(controller: "login", action: "index")
                }
            }
        }

    }
}
