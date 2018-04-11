package linksharing

import bootcamp.User
import grails.gorm.transactions.Transactional
import viewObject.UserVO

@Transactional
class UserService {

    def changePassword(String oldPassword, String newPassword, String confirmNewPassword, User user) {
        Long userId = user.id
        if (newPassword.equals(confirmNewPassword)) {
            User.executeUpdate("update User u set u.password=:newPassword where u.password=:oldPassword and u.id=:userId", [newPassword: newPassword, oldPassword: oldPassword, userId: userId])
        }
    }

    def updateProfile(Map userData, User user) {
        if (userData.updatedFirstname) {
            user.firstName = userData.updatedFirstname

        }
        if (userData.updatedLastname) {
            user.lastName = userData.updateLastname
        }
        if (userData.updatedUsername) {
            user.userName = userData.updatedUsername

        }

        if (userData.updatedPhoto)
            user.photo = userData.updatedPhoto.bytes

        if (user.save(flush: true)) {
            log.info("Credentials Updated : $user")
            return true
        } else {
            log.error("Error Updating Credentials : $user")
            user.errors.allErrors.each { println it }
            return false
        }
    }


    def showAllUsers() {
        List<User> userList = User.findAllByAdmin(false)
        if (userList) {
            List<UserVO> allUsers = []
            userList.each {
                allUsers.add(new UserVO(name: it.getFirstName(), username: it.userName, active: it.active, userId: it.id))
            }
            return allUsers
        } else
            return null
    }


}
