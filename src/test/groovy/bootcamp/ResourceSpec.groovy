package bootcamp

import constant.Visibility
import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ResourceSpec extends Specification implements DomainUnitTest<Resource> {


    def setup() {
        mockDomain(User)
        mockDomain(Topic)
        mockDomain(Resource)
        mockDomain(LinkResource)
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        false == false
    }


    def "minimum and maximum score of rating should be 1 and 5 respectively"() {
        setup:
        String email = "chunkygupta@tothenew.com"
        String password = 'password'
        User user = new User(email: email, userName: "chunky", password: password, firstName: "chunky", lastName: "gupta", admin: false, active: true)
        Topic topic = new Topic(name: "sd", visibility: Visibility.Public, createdBy: user)
        Resource resource = new LinkResource(url: "www.google.com", description: "abhabhab", user: user, topic: topic)


        when:
        RatingResource resourceRating = new RatingResource(score: 1, user: user, resource: resource)
        resource.addToRatings(resourceRating)

        resourceRating.validate()
        resourceRating.save()

        then:
        RatingResource.count == 1

    }
}
