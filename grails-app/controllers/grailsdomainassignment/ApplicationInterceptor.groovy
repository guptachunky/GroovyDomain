package grailsdomainassignment

import utilities.AppConstants


class ApplicationInterceptor {

    ApplicationInterceptor() {
        match(controller: "login")
    }

    boolean before() {

        if (!session.user) {
            flash.error = "NO ACTIVE SESSION"
            false
        }
        log.info("ACTION AND CONTROLLER LOG: ${params.toString()}")

        true
    }

    boolean after() {
        flash.message = "Flashing"
        log.info("ACTION AND CONTROLLER LOG: ${params.toString()}")

        return true
    }

    void afterView() {
    }
}
