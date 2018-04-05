package grailsdomainassignment


class LoginCheckInterceptor {

    LoginCheckInterceptor() {
        matchAll().excludes(controller:'login')

    }

    boolean before() {
//        if (!session.user) {
//            flash.error = "NO ACTIVE SESSION"
//            false
//        }

        true

    }

    boolean after() { true }

    void afterView() {
        // no-op
    }

}
