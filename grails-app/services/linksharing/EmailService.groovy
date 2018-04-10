package linksharing

import DTO.EmailDTO
import bootcamp.Resource
import bootcamp.User
import grails.gorm.transactions.Transactional
import org.springframework.context.MessageSource

@Transactional
class EmailService {

    static transactional = false
    def mailService
    MessageSource messageSource

    def serviceMethod() {

    }


    def sendMail(EmailDTO emailDTO) {
        mailService.sendMail {
            to emailDTO.to
            subject emailDTO.subject
            body emailDTO.content

        }
    }


    def sendUnreadResourcesEmail(List<User> users, List<Resource> resourceList) {

    }
}
