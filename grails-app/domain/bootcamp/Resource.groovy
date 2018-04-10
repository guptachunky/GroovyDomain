package bootcamp

import commandobject.ResourceSearchCo
import constant.Visibility
import viewObject.RaitingInfoVO

abstract class Resource {

    String description
    Date dateCreated
    Date lastUpdated


    static namedQueries = {
        search { ResourceSearchCo resourceSearchCo ->
            eq 'topic.id', resourceSearchCo.topicId
            eq('topic.visibility', resourceSearchCo.visibility)
        }

    }

    static transients = ['topPost']
    static belongsTo = [user: User, topic: Topic]

    static hasMany = [ratings: RatingResource, readingItems: ReadingItem]

    static constraints = {
        description(type: 'text')
    }


    Boolean canViewedBy(User user) {

        if (this.topic.visibility == Visibility.Public) {
            true
        } else if (user.admin) {
            true
        } else if (this.topic.createdBy == user) {
            true
        } else {
            false
        }

    }

    RaitingInfoVO getRatingInfoVO() {

        return ratingInfoVO
    }

    Integer totalVotes(Resource resource) {
        Integer votes = RatingResource.createCriteria().count() {

            eq("resource", resource)
        }

        return votes
    }

    def avgScore(Resource resource) {
        def average = RatingResource.createCriteria().get {
            projections {
                avg('score')
            }
            eq("resource", resource)
        }

        return average

    }

    def totalScore(Resource resource) {
        def sum1 = RatingResource.createCriteria().get() {

            projections {
                sum('score')
            }
            eq("resource", resource)
        }

        return sum1
    }


    List<User> getSubscribedUsers() {
        List listOfResources = []
        listOfResources = Resource.findByTopic(this.topic)
        listOfResources

    }


    static String findResource() {

        this.getClass().getName()
    }


    static List<Resource> getRecentShares() {

        List<Resource> recentShares = Resource.createCriteria().list {
            order("dateCreated", "desc")
            maxResults(2)

        }
        println("about to return")
        return recentShares
    }


    static List<Resource> getPosts(User user) {
        List<Resource> resourceList = Resource.createCriteria().list {
            eq("user", user)
        }
        return resourceList
    }

    static List<Resource> getTopPost() {

        List resourceIds = RatingResource.createCriteria().list {
            projections {
                property('resource.id')
            }
            groupProperty('resource.id')
            count('resource.id', 'resourceCount')
            order('resourceCount', 'desc')
            maxResults(5)
        }

        List<Resource> resources = Resource.getAll(resourceIds)
        return resources

    }

}
