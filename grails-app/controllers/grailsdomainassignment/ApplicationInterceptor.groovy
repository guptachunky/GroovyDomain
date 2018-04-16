package grailsdomainassignment

class ApplicationInterceptor {

    ApplicationInterceptor() {
        matchAll()
    }

    boolean before() {

        log.info("Incoming request: ${params.toString()}")

        true
    }

    boolean after() {

        return true
    }

    void afterView() {
    }
}
