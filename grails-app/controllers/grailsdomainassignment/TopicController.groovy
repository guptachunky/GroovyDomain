package grailsdomainassignment

import bootcamp.Topic
import bootcamp.User

class TopicController {

    def index() {}

    def show() {
        User user = User.get(session.user.id)

    }

    def delete(Integer id) {
        Topic topic = Topic.load(id)

    }

    def save(Topic topic, String Seriousness) {

        if (topic.save()) {
            flash.message = "Topic Saved Successfully"
            render("success")
        } else {
            log.error(topic.errors.allErrors)
            flash.message = "Topic not saved"
            render("error")
        }

    }
}
