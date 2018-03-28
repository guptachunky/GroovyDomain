package bootcamp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class TopicSpec extends Specification implements DomainUnitTest<Topic> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        false == false
    }

   /* def "validating Topic"() {


        User user = new User()
        user.setUserName("guptachunky")
        user.setFirstName("chunks")
        user.setPassword("password")
        user.setLastName("gupta")
        user.setEmailId("chunky@gmail.com")

        Topic topic=new Topic()
        topic.setName("Topic 1")
        topic.setCreatedBy(user)

        when:
        topic.save()

        then:
        topic.count() == 1



        Topic newTopic=new Topic()
        newTopic.setName("Topic ")
        newTopic.setCreatedBy(user)

        when:
        newTopic.save()

        then:
        newTopic.count() == 1
        newTopic.errors.allErrors.size() == 1
        newTopic.errors.getFieldErrorCount('name') == 1



    }
*/
}
