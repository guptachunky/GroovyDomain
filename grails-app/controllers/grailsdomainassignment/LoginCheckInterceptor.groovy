package grailsdomainassignment


class LoginCheckInterceptor {

    LoginCheckInterceptor() {
        matchAll().excludes(controller: "login")
    }

    boolean before() {
//        if (!session.user) {
//            flash.error = "session not active"
//            redirect(view:"login")
//
//        }

        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }

}
