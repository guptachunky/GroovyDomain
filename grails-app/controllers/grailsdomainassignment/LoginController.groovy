package grailsdomainassignment

import bootcamp.User

class LoginController {

    def index() {

//        if (session.user) {
////            render(view: "index")
//            forward(controller: "user", action: "index")
//        } else
//            render(text: "Failure")
    }

    def loginHandler(String username, String password) {
        User user = User.findByUserNameAndPassword(username, password)
        if (user) {

            if (user.active) {
                session.user = user
                redirect(controller: "login", action: "index")
            } else {

                flash.error = "YOUR ACCOUNT IS INACTIVE"
            }
        } else {
            flash.error = "User Not Found"
//            redirect(controller: "login", action: "index")
        }
        render(view: "index")
    }

    def logout() {
        session.invalidate()
        redirect(controller: "login", action: "index")

    }

}
