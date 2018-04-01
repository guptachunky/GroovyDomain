package grailsdomainassignment

import bootcamp.Topic
import bootcamp.User
import constant.Visibility
import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class TopicControllerSpec extends Specification implements ControllerUnitTest<TopicController>, DomainUnitTest<Topic> {

    def setup() {
        mockDomain(User)
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        true == false
    }

//    def "topic should be saved on save action"() {
//        given:
//        User user = new User(email: "chunky@gmail.com", userName: "chunkygupta", password: "ROOT@123",
//                firstName: "Chunky", lastName: "Gupta", admin: false, active: true, photo: 101)
//
//        session.user = user
//        Topic topic = new Topic(name: "topic20", visibility: Visibility.Public, createdBy: session.user)
//        when:
//        controller.save(topic, "Casual")
//
//        then:
//        println(topic.createdBy)
//        response.contentAsString == "success"
//
//
//    }
//
//    def "Delete topic"() {
//        given:
//        User user = new User(email: "chunky@gmail.com", userName: "chunkygupta", password: "ROOT@123",
//                firstName: "Chunky", lastName: "Gupta", admin: false, active: true, photo: 101)
//
//        session.user = user
//        Topic topic = new Topic(name: "topic20", visibility: Visibility.Public, createdBy: session.user)
//        topic.save(flush: true)
//        user.addToTopics(topic)
//        user.save()
//        println(topic.id)
//        when:
//        controller.delete(topic.id)
//        then:
//        response.contentAsString == "sucess"
//
//    }

}
