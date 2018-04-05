package bootcamp

import constant.Seriousness
import constant.Visibility
import viewObject.TopicVO

class Topic {

    String name
    static belongsTo = [createdBy: User]
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static hasMany = [subscriptions: Subscription, resources: Resource]

    static List<TopicVO> getTrendingTopic() {

        List<Topic> topicList = Resource.createCriteria().list {
            projections {
                createAlias('topic', 't')
                groupProperty('t.id')
                property('t.name')
                property('t.visibility')
                count('t.id', 'topicCount')
                property('t.createdBy')
            }
            eq('t.visibility', Visibility.Public)
            order('topicCount', 'desc')
            order('t.name', 'asc')
            maxResults(5)

        }


        List topicVOList = []
        topicList.each {

            topicVOList.add(new TopicVO(id: it[0], name: it[1], visibility: it[2], count: it[3], createdBy: it[4]))


        }
        return topicVOList

    }


    List getSubscribedUsers() {
        List<User> listOfUsers = []
        return this.subscriptions.each {
            listOfUsers.add(it.user)
        }

    }

    static constraints = {

        name(blank: false, nullable: false, unique: "createdBy")
        visibility(nullable: false)
    }

    def afterInsert() {
        Topic.withNewSession {

            println(this.name)
            Subscription subscription = new Subscription()
            subscription.setTopic(this)
            subscription.setUser(this.createdBy)
            subscription.setSeriousness(Seriousness.Casual)
            if (subscription.save(flush: true)) {
                log.info "Subscription ${subscription} saved successfully"
            } else {
                log.error "Error saving subscription : ${subscription.errors.allErrors}"
            }

        }
    }

    @Override
    String toString() {
        return "Topic{" +
                "name='" + name + '\'' +
                '}'
    }


    Boolean isPublic() {
        if (this.visibility == Visibility.Public) {
            true
        } else
            false
    }


}
