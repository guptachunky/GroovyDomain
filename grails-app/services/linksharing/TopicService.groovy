package linksharing

import bootcamp.Topic
import bootcamp.User
import commandobject.TopicSearchCO
import grails.gorm.transactions.Transactional
import constant.Visibility
import viewObject.TopicSearchVo

@Transactional
class TopicService {

    def delete(Topic topic) {
        topic.delete(flush: true)

    }

    def search(TopicSearchCO topicSearchCO) {

        User user = topicSearchCO.getUser()
        Visibility visibility = topicSearchCO.visibility
        TopicSearchVo topicSearchVo = new TopicSearchVo(user: user, visibility: visibility)
        return topicSearchVo
    }

    def publicSearch(String name) {
        List<Topic> topicList = Topic.findAllByNameAndVisibility(name, Visibility.Public)

        return topicList
    }

    def changeVisibility(Map topicData) {
        Topic topic = Topic.findById(topicData.id)
        topic.visibility = topicData.visibility
        if (topic.save(flush: true)) {
            log.info("Visibility Changed : $topic")
            return true
        } else {
            log.error("Unable to Change Visibility : $topic")
            topic.errors.allErrors.each { println it }
            return false
        }
    }

}
