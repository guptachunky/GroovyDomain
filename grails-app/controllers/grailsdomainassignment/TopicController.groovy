package grailsdomainassignment

import DTO.EmailDTO
import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User
import org.apache.commons.lang.RandomStringUtils

class TopicController {

    def index() {}

    def show() {

    }


    def invite(Integer id, String emailId) {

        if (Topic.get(id) && User.findByEmailId(emailId)) {
            EmailDTO emailDTO = new EmailDTO(to: params.emailId, subject: "invitation for Topic Subscription",
                    from: "rg488592@gmail.com", linkId: topic.id, content: "your new subscription")
            println(emailDTO.properties)

            emailService.sendInvitation(emailDTO)

        } else
            flash.error = "User Not Found"
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




    def join(Integer id) {

        Topic topic = Topic.findById(id)
        User user = topic.createdBy
        Subscription subscription = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)

        if (subscription.validate()) {
            subscription.save()
            flash.message = "Subscription saved successfully"
            render("Subscription Successfully Created")
        } else {
//            subscription.errors.allErrors.each { println(it) }
            flash.error = "subscription could not be saved"
            render("Subscription could not be saved")
        }

    }

}
