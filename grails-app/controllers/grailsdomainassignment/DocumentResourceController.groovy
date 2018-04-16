package grailsdomainassignment

import linksharing.ResourceService

class DocumentResourceController extends ResourceController {

    ResourceService resourceService

    def index() {}

    def save() {
        params.createdBy = session.user

    }
}
