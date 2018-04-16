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

        Boolean canView = params.resource.canViewedBy(session.user)

    }


    def changeIsRead() {
        Resource resource = Resource.get(params.id)
        ReadingItem readingItem = ReadingItem.findByResourceAndUser(resource, session.user)
        if (readingItem.isRead) {
            readingItem.isRead = false
            readingItem.save(flush: true)
        } else {

            readingItem.isRead = true
            readingItem.save(flush: true)
        }
        redirect(controller: 'login', action: 'index')
    }


    def changeIsSubscribe() {
        Resource resource = Resource.get(params.id)
        ReadingItem readingItem = ReadingItem.findByResourceAndUser(resource, session.user)
        if (readingItem) {
            readingItem.isRead = false
            readingItem.save()
        } else {
            new ReadingItem(user: session.user, resource: resource, isRead: true).save()

        }
        render(view: "/resource/search")
    }

    def search() {

    }


    def notFoundException(Exception exception) {
        log.error "Exception occurred. ${exception?.message}", exception
    }


    protected def addToReadingItems(Resource resource) {

    }
}
