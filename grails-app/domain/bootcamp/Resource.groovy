package bootcamp

import commandobject.ResourceSearchCo
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
    static belongsTo = [user: User, topic: Topic]

    static hasMany = [ratings: RatingResource, readingItems: ReadingItem]

    static constraints = {
        description(type: 'text')
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
}
