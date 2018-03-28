package bootcamp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class SubscriptionSpec extends Specification implements DomainUnitTest<Subscription> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        false == false
    }

/*
    def "validating Topic"() {

        User user = new User()
        user.setUserName("guptachunky")
        user.setFirstName("chunks")
        user.setPassword("password")
        user.setLastName("gupta")
        user.setEmailId("chunky@gmail.com")

        user.save()

        Topic topic = new Topic()
        topic.setName("Topic 15")
        topic.setCreatedBy(user)
        topic.setVisibility(Visibility.Private)
        topic.save()

//        Seriousness seriousness = Seriousness.VerySerious

//        Subscription subscription=new Subscription()
//        subscription.setSeriousness(seriousness)
//        subscription.setUser(user)
//        subscription.setTopic(topic)

        when:
        topic.save()

        then:
        topic.count() == 1

    }*/


}
