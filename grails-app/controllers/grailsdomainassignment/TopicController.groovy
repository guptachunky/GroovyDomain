package grailsdomainassignment

import DTO.EmailDTO
import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User
import constant.Seriousness
import linksharing.EmailService
import linksharing.TopicService
import org.apache.commons.lang.RandomStringUtils
import viewObject.TopicVO

class TopicController {

    TopicService topicService
    EmailService emailService

    def index() {}

    def show() {
        Topic topic = Topic.findById(params.id)
        render(view: '/topic/show', model: [topic: topic])
    }

    def search() {

        String topicName = params.key
        List<Topic> topicNames = topicService.publicSearch(topicName)

        render(view: "/topic/searchResult", model: [topicNames: topicNames])

    }

    def changeVisibility() {

        if (topicService.changeVisibility(params)) {
            flash.message = "Updated"
        } else {
            flash.error = "Unable to Update"
        }
        redirect(controller: 'user', action: 'editProfile')
    }


    def invite() {

        Topic topic = Topic.findById(params.topic)
        String email = params.to
        if (topic && User.findByEmailId(email)) {
            EmailDTO emailDTO = new EmailDTO(to: email, subject: "invitation for Topic Subscription",
                    from: "rg488592@gmail.com", linkId: topic.id, content: "your new subscription")
            println(emailDTO.properties)
            emailService.sendMail(emailDTO)
            flash.message = "Success"

        } else
            flash.error = "somee error"

        redirect(controller: 'user', action: 'index')
    }


    def delete(Integer id) {
        Topic topic = Topic.get(params.id)
        if (!topic) {
            flash.error = "topic not found"
            redirect(controller: 'user', action: 'index')


        } else {
            topicService.delete(topic)
            flash.message = "topic deleted"
            redirect(controller: 'user', action: 'index')

        }
    }

    def save(Topic topic) {

        topic.createdBy = session.user

        if (topic.save()) {
            flash.message = "Topic Saved Successfully"
        } else {
            flash.message = "Topic not saved"
        }
        redirect(controller: 'user', action: 'index')


    }


    def join(Integer id) {

        Topic topic = Topic.findById(id)
        User user = topic.createdBy
        Subscription subscription = new Subscription(topic: topic, user: user, seriousness: Seriousness.Serious)

        if (subscription.validate()) {
            subscription.save()
            flash.message = "Subscription saved successfully"
            redirect(controller: 'user', action: 'index')

        } else {
            flash.error = "subscription could not be saved"
            redirect(controller: 'user', action: 'index')

        }

    }

}
