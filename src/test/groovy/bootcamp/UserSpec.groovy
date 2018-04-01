package bootcamp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class UserSpec extends Specification implements DomainUnitTest<User> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        false == false
    }

  void "test employee validations"() {
        setup:

        User user = new User()
        user.setUserName("guptachunky")
        user.setFirstName(firstName)
        user.setPassword(password)
        user.setLastName(lastName)
        user.setEmailId(emailId)
        when:
        Boolean result = user.validate()

        then:
        result == valid
        where:
        sno | firstName | lastName | emailId          | password   | valid
        1   | ""        | "hello"  | "a@b.com"        | "test123"  | false
        2   | "chunky"  | "hello"  | "chunky"         | "test123"  | false
        3   | "chunks"  | "gupta"  | "chunky@acb.com" | "test1234" | true
    }

    def "Email address of employee should be unique"() {
        setup:

        User user = new User()
        user.setEmailId("c@gmail.com")
        user.setFirstName("chunks")
        user.setLastName("gupta")
        user.setPassword("abcd")
        user.setUserName("chunkygupta")
        when:
        user.save()

        then:
        user.count() == 1

        User newUser = new User()
        newUser.setEmailId("c@gmail.com")
        newUser.setFirstName("chunks")
        newUser.setLastName("gupta")
        newUser.setPassword("abcd")
        newUser.setUserName("guptachunky")
        when:
        newUser.save()

        then:
        newUser.count() == 1
        newUser.errors.allErrors.size() == 1
        newUser.errors.getFieldErrorCount('emailId') == 1


    }


    def "userName should be uniques"() {
        setup:

        User user = new User()
        user.setEmailId("c@gmail.com")
        user.setFirstName("chunks")
        user.setLastName("gupta")
        user.setPassword("abcd")
        user.setUserName("guptachunky")
        when:
        user.save()

        then:
        user.count() == 1


        User newUser = new User()
        newUser.setEmailId("ch@gmail.com")
        newUser.setFirstName("chunks")
        newUser.setLastName("gupta")
        newUser.setPassword("abcd")
        newUser.setUserName("guptachunky")
        when:
        newUser.save()

        then:
        newUser.count() == 1
        newUser.errors.allErrors.size() == 1
        newUser.errors.getFieldErrorCount('userName') == 1

    }


}
