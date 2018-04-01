package grailsdomainassignment

import bootcamp.Resource
import bootcamp.Topic
import commandobject.ResourceSearchCo

import constant.Visibility
import viewObject.RaitingInfoVO

class ResourceController {

    def index() {}

    def delete(Integer id) {
        Resource resource = Resource.load(id)
    }

    def show(Integer id) {
        Resource resource = Resource.get(id)
        RaitingInfoVO ratingInfoVO = resource.getRatingInfoVO(resource)
        render(ratingInfoVO.averageScore)

        println("--------------------------")
        println Topic.getTrendingTopic()


    }


    def search() {

        ResourceSearchCo resourceSearchCo = new ResourceSearchCo()

        if (resourceSearchCo.q) {
            resourceSearchCo.visibility = Visibility.Public
        }
    }

    def notFoundException(Exception exception) {
        log.error "Exception occurred. ${exception?.message}", exception
    }
}
