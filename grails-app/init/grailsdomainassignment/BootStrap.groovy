package grailsdomainassignment

import bootcamp.User

class BootStrap {

    def init = { servletContext ->
        User user = new User()
        user.setEmailId("chunks@gmail.com")
        user.setFirstName("chunks")
        user.setPassword("abcdg")
        user.setLastName("gupta")
        user.setUserName("chunky")
        println(user.save())

    }
    def destroy = {
    }
}
