package grailsdomainassignment

import bootcamp.User
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class LoginControllerSpec extends Specification implements ControllerUnitTest<LoginController> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect: "fix me"
        true == false
    }

    def "check when user sessions exists in index method"() {
        given: "a session user exists"
        session["user"] = new User()

        when:
        controller.index()

        then:
        response.forwardedUrl == '/user/index'
    }

    def "check if user session exists in index method"() {
        given: "a session user exists"
        session["user"] = null

        when:
        controller.index()

        then:
        response.contentAsString == "Failure"
    }

    def "if user is logged out"() {
        when:
        controller.logout()
        then:
        !session.user
        response.redirectUrl == '/login/index'
    }

    def "check if user exists but not active"() {
        given:
        User user = new User(email: "chunkygupta95@gmail.com", userName: "guptachunky", password: "chunky",
                firstName: "chunky", lastName: "gupta", admin: false, active: false, photo: 101)

        user.save(flush: true)
        when:
        controller.loginHandler(user.userName, user.password)
        then:
        flash.error == "YOUR ACCOUNT IS INACTIVE"
        response.redirectUrl == '/login/index'
    }

    def "check if user doesn't exist"() {
        given:
        String username = "chunky"
        String password = "gupta"

        when:
        controller.loginHandler(username, password)

        then:
        flash.error == "User Not Found"
        response.redirectUrl == '/login/index'
    }

    def "check if user exists and is active"() {
        given:
        User user = new User(email: "chunkygupta95@gmail.com", userName: "guptachunky", password: "chunky",
                firstName: "chunky", lastName: "gupta", admin: false, active: true, photo: 101)
        user.save(flush: true)

        when:
        controller.loginHandler(user.userName, user.password)

        then:
        response.forwardedUrl == '/user/index'
    }
}
