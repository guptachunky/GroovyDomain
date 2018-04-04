package grailsdomainassignment

import bootcamp.ReadingItem
import bootcamp.Resource
import bootcamp.Topic
import bootcamp.User
import commandobject.ResourceSearchCo

import constant.Visibility
import viewObject.RaitingInfoVO

class ResourceController {

    def index() {}

    def delete(Integer id) {
        Resource resource = Resource.load(id)
    }

    def show() {

        Boolean canView =params.resource.canViewedBy(session.user)

    }


    def changeIsRead() {
        Resource resource = params.resource
        User user = session.user

        ReadingItem readingItem = ReadingItem.findByUserAndResource(user, resource)
    }


    def search() {

        flash.error = "No Search Criteria"


    }

    def notFoundException(Exception exception) {
        log.error "Exception occurred. ${exception?.message}", exception
    }
}
