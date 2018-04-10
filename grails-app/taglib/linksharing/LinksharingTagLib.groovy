package linksharing

import bootcamp.ReadingItem
import bootcamp.Resource
import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User

class LinksharingTagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"

    def userImage = { attr, body ->

        if (session.user.photo) {
            out << " <img class='img-responsive'alt='dummy' height='64' width='64' src='data:image/png;base64,${session.user?.photo.encodeBase64()}'/>"

        } else
            out << " <img class='img-responsive'alt='dummy' height='64' width='64' src='data:image/png;base64,${session.user?.photo.encodeBase64()}'/>"
    }

    def readLink = { attr, body ->
        Resource resource = Resource.get(attr.read)
        ReadingItem readingItem = ReadingItem.findByResourceAndUser(resource, session.user)

        String value = ""
        if (readingItem && readingItem?.isRead) {
            value = "Mark As Unread"
        } else {
            value = "Mark As Read"

        }
//        String value = session.user ? "Mark as Read" : "Mark As Unread"

        out << value
    }


    def showSubscribe = {
        attr, body ->

            boolean isSubscribed = User.isSubscribed(attr.topic)
            String value = ""
            if (isSubscribed) {
                value = "UnSubscribe"
            } else {
                value = "Subscribe"

            }
            out << value

    }


    def subscriptionCount = {
        attr, body ->

            Integer count = 0
            List listOfSubscriptions = []
            if (attr.topic) {

                listOfSubscriptions = Subscription.findByTopic(attr.topic)
                return listOfSubscriptions.size()

            } else {

                listOfSubscriptions = Subscription.findByUser(session.user)
                return listOfSubscriptions.size()
            }


    }


    def resourceCount = {
        attr, body ->

            return Resource.countByTopic(attr.topic)
    }


    def topicCount = {
        attr, body ->
            return Topic.countByCreatedBy(session.user)
    }

    def trendingTopics = { attr, body ->


    }
}
