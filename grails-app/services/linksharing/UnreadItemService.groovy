package linksharing

import DTO.EmailDTO
import bootcamp.ReadingItem
import bootcamp.Resource
import bootcamp.User
import grails.gorm.transactions.Transactional

@Transactional
class UnreadItemService {

    boolean lazyInit = false

    EmailService emailService

    def unreaditem() {
        List<User> userList = User.findAll()
        List<String> topicName = []
        List<String> createdBy = []

        userList.each { user ->
            List<ReadingItem> readingItemList = ReadingItem.findAllByUserAndIsRead(user, true)

            readingItemList.resource.each { list ->

                topicName.add(list.topic.name)
                createdBy.add(list.user.firstName)
            }

            EmailDTO emailDTO = new EmailDTO(to: user.emailId, subject: "Unread items in inbox", itemList: topicName, createrList: createdBy)

            emailService.sendUnreadResourcesEmail(emailDTO)

            println(emailDTO.properties)

            topicName = []
            createdBy = []

        }
    }

    def inbox(User user) {

        List<Resource> resources = []

        List<ReadingItem> readingItemList = ReadingItem.findAllByUserAndIsRead(user, true)
        readingItemList.each {
            resources.add(it.resource)
        }
        return resources

    }
}
