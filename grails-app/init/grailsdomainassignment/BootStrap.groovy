package grailsdomainassignment

import bootcamp.Topic
import bootcamp.User
import constant.Visibility

class BootStrap {

    def init = { servletContext ->


        createTopic()

//        Ques first And Second
//        User normal = new User()
//        normal.setEmailId("chunks@gmail.com")
//        normal.setFirstName("chunks")
//        normal.setPassword("abcdg")
//        normal.setLastName("gupta")
//        normal.setUserName("chunky")
//        normal.setActive(true)
//        normal.setAdmin(false)
//        normal.save(flush: true)
//
//        User admin = new User()
//        admin.setEmailId("chunky@gmail.com")
//        admin.setFirstName("chunky")
//        admin.setPassword("abcdg")
//        admin.setLastName("gupta")
//        admin.setUserName("chunkyGupta")
//        admin.setActive(true)
//        admin.setAdmin(true)
//        admin.save(failOnError: true)


    }

    def createTopic() {

        User normal = new User()
        normal.setEmailId("chunks@gmail.com")
        normal.setFirstName("chunks")
        normal.setPassword("abcdg")
        normal.setLastName("gupta")
        normal.setUserName("chunky")
        normal.setActive(true)
        normal.setAdmin(false)
        normal.save(flush: true)

        Integer count = Topic.countByCreatedBy(normal)

        if (count == 0){
            5.times {
                Topic topic=new Topic()
                topic.setCreatedBy(normal)
                topic.setName("title ${it}")
                topic.setVisibility(Visibility.Private)
                topic.save()
            }
        }

    }


    def destroy = {
    }
}
