package grailsdomainassignment


class LoginCheckInterceptor {

    LoginCheckInterceptor() {
        matchAll().excludes(controller: "login", action: "loginHandler")
    }

    boolean before() {
        if (!session.user) {
            flash.error = "session not active"
            redirect(view: "login/index")
        }

        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
