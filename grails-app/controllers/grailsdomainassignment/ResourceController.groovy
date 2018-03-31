package grailsdomainassignment

import bootcamp.Resource

class ResourceController {

    def index() {}

    def delete(Integer id) {
        Resource resource = Resource.load(id)
    }

    def notFoundException(Exception exception) {
        log.error "Exception occurred. ${exception?.message}", exception
    }
}
