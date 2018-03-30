package linksharing

import grails.testing.web.interceptor.InterceptorUnitTest
import grailsdomainassignment.LoginCheckInterceptor
import spock.lang.Specification

class LoginCheckInterceptorSpec extends Specification implements InterceptorUnitTest<LoginCheckInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test login interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"login")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
