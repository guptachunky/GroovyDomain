package grailsdomainassignment

class DocumentResourceController {

//    ResourceService resourceService

    def index() {}

    def save() {
        params.createdBy = session.user

//        if (resourceService.saveDocumentResource(params)) {
//            flash.message = "DOCUMENT RESOURCE SAVED"
//        } else {
//            flash.message = "ERROR"
//        }
//        redirect(controller: 'user', action: 'index')
    }
}
