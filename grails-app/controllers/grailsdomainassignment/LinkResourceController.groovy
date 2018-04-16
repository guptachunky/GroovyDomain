package grailsdomainassignment

import bootcamp.LinkResource
import bootcamp.Resource

class LinkResourceController extends ResourceController {

    def index() {}

    def save(LinkResource linkResource) {

        Resource resource = linkResource
        resource.user = session.user
        if (resource.save()) {
            flash.message = "Saved"

        } else {
            flash.error = "Error"

        }
        forward(controller: 'user', action: 'index')

    }
}
