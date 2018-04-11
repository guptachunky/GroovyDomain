package grailsdomainassignment

import DTO.EmailDTO
import bootcamp.ReadingItem
import bootcamp.Resource
import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User
import constant.Visibility
import linksharing.EmailService
import linksharing.UnreadItemService
import linksharing.UserService
import org.springframework.context.MessageSource
import utilities.Util
import viewObject.UserVO


class UserController {

    MessageSource messageSource
    UnreadItemService unreadItemService
    EmailService emailService
    UserService userService

    def index() {

        if (session.user) {
            List<Resource> resourceList = unreadItemService.inbox(session.user)
            render(view: "index", model: [resourceList: resourceList])
        } else
            redirect(controller: 'login', action: 'index')

    }


    def register(User user) {


        def file = params.photo
        user.photo = file.bytes
        user.active = true
        user.admin = false

//        if(user.hasErrors()){
//            user.errors.fieldErrors.join()
//
//        }


        if (user.save()) {

            flash.message = "Successfully User Stored"
            session.user = user
        } else {
            flash.error = "error in register"
        }

    }


    def forgotPassword(String emailId) {
        User user = User.findByEmailId(emailId)
        if (user && user.active) {

            String newPassword = new Util().getRandomPassword()
            EmailDTO emailDTO = new EmailDTO(to: emailId, subject: "For LinkSharing Password", from: "rg488592@gmail.com", content: "hey Therer your New Password : ${newPassword}")

            emailService.sendMail(emailDTO)

            flash.message = "password sent"
            render(" New Password Is Sent To Registered Email Id")
        } else {
            render("Invalid email id")
        }
    }


    def userProfile() {

    }

    def show(Integer id) {
        Integer myId = (Integer) params.id
        Topic topic = Topic.get(myId)
        if (!topic) {
            flash.error = "Topic Not Found"
            redirect(controller: "login", action: "index")
        } else {
            if (topic.visibility == Visibility.Public) {

                render(text: "Success")
            } else {
                Subscription subscription = Subscription.findByUserAndTopic(session.user, topic)
                if (subscription) {
                    render(text: "Success")
                } else {
                    flash.error = "Subscription Not found"
                    redirect(controller: "login", action: "index")
                }
            }
        }

    }


    def image(Long id) {
        User user = User.get(id)
        if (user) {
            render(user.photo)

        } else {
            render("dummy photo")
        }

    }


    def changePassword() {
        String oldPassword = params.oldPassword
        String newPassword = params.updatedPassword
        String confirmNewPassword = params.updatedConfirmPassword

        User user = session.user
        if (userService.changePassword(oldPassword, newPassword, confirmNewPassword,user)) {
            render(text: "Successfull")
        } else {
            render(text: "UnsuccessFull")
        }

    }


    def updateUser() {
        if (userService.updateProfile(params, session.user)) {
            flash.message = "Update Successful"
            render(text: "Success")
        } else
            flash.error = "Unable To Update "
        render(text: "failure")
    }


    def showUserListToAdmin() {
        List<UserVO> allUsers = userService.showAllUsers()
        render(view: '/user/adminView', model: [allUsers: allUsers])
    }

}
