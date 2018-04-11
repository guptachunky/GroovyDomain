package grailsdomainassignment

import bootcamp.User
import org.springframework.context.MessageSource
import utilities.AppConstants

class LoginController {

    def index() {
//        if (session.user) {
//            log.info("REDIRECTING TO USER INDEX")
//            forward(controller: "User", action: "index")
//        } else {
//            log.info("NO SESSION USER FOUND")
//            render(view: 'index')
//        }
    }

    def loginHandler(String userName, String password) {
        User user = User.findByUserNameAndPassword(userName, password)
        if (user) {

            if (user.active) {
                session.user = user
                forward(controller: "user", action: "index")
            } else {

                flash.error = "YOUR ACCOUNT IS INACTIVE"
            }
        } else {
            flash.error = "User Not Found"
        }
        render(view: "index")
    }

    def logout() {
        session.invalidate()
        redirect(controller: "login", action: "index")

    }

    def register() {
        User admin = new User(email: "admin@gmail.com", password: AppConstants.PASSWORD, firstName: "admin", lastName: "admin", userName: 'adminLogin', photo: 121, admin: true, active: true)
        if (admin.save()) {
            flash.message = "Admin Saved Successfully"
        } else {
            flash.error = "error"
        }

        //normal
        User normal = new User(email: "chunkygupta95@gmailcom", password: AppConstants.PASSWORD, firstName: "chunky", lastName: "gupta", userName: 'guptachunky', photo: 111, admin: false, active: true)
        if (normal.save()) {
            flash.message = "Normal User Saved Successfully"
        } else {
            flash.error = "error"
        }
        session.user = normal

        redirect(action: "index")
    }

}
