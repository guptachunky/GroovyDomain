package linksharing

import bootcamp.User
import commandobject.TopicSearchCO
import grails.gorm.transactions.Transactional
import constant.Visibility
import viewObject.TopicSearchVo

@Transactional
class TopicService {

    def serviceMethod() {

    }

    def search(TopicSearchCO topicSearchCO) {

        User user = topicSearchCO.getUser()
        Visibility visibility = topicSearchCO.visibility
        TopicSearchVo topicSearchVo = new TopicSearchVo(user: user, visibility: visibility)
        return topicSearchVo
    }
}
