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

    def save(Topic topic) {

        println(params)
        topic.createdBy = session.user

        if (topic.save()) {
            flash.message = "Topic Saved Successfully"
            render("success")
        } else {
            flash.message = "Topic not saved"
            render("error")
        }


    }


}
