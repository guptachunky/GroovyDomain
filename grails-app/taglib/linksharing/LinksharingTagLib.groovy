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


    def readLink = { attr, body ->
        Resource resource = Resource.get(attr.read)
        ReadingItem readingItem = ReadingItem.findByResourceAndUser(resource, session.user)

        String value = ""
        if (readingItem && readingItem?.isRead) {
            value = "Mark As Unread"
        } else {
            value = "Mark As Read"

        }

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


    def trendingTopics = { attr, body ->


    }


    def inboxSubscriptionCount = { attrs, body ->
        Topic topic = Topic.findById(attrs.id)
        out << Subscription.findAllByTopic(topic).size()

    }

    def inboxResourceCount = { attrs, body ->
        Topic topic = Topic.findById(attrs.id)
        out << Resource.findAllByTopic(topic).size()

    }

    def resourceCount = { attrs, body ->
        out << Resource.findAllByTopic(attrs.id).size()

    }

    def topicCount = {
        out << Topic.findAllByCreatedBy(session.user).size()
    }

    def userSubscriptionCount = {
        out << Subscription.findAllByUser(session.user).size()
    }

    def userImage = { attrs, body ->

        out << "<img src='${createLink(controller: 'user', action: 'fetchUserImage', params: [username: attrs.username])}' " +
                " height='${attrs.height}' width='${attrs.width}'>"
    }


}
