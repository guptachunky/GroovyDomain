package grailsdomainassignment

import bootcamp.DocumentResouce
import bootcamp.LinkResource
import bootcamp.Resource
import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User
import constant.Seriousness
import constant.Visibility

class BootStrap {

    def init = { servletContext ->

        println "srat"

//        AppConstants.PASSWORD
//
//        5.times {
//            User normal = new User()
//            normal.setEmailId("chunks@gmail.com${it}")
//            normal.setFirstName("chunks${it}")
//            normal.setPassword("abcdg${it}")
//            normal.setLastName("gupta${it}")
//            normal.setUserName("chunky${it}")
//            normal.setActive(true)
//            normal.setAdmin(false)
//            normal.validate()
//            log.error(normal.errors.allErrors)
//            println normal.save(validate: false)
//
//        }
//
//
//        Topic topic = new Topic()
//        topic.setVisibility(Visibility.Private)
//        topic.setName("topic name")
//        topic.setCreatedBy(User.get(1))
//        topic.validate()
//        log.error(topic.errors.allErrors)
//        topic.save()
//
//        subscribeTopics()
//        createResource()
//        createTopic()
//addNormalAndAdmin()

    }


    def subscribeTopics() {

        List<User> users = User.getAll()

        users.each {

            User user = it
            List<Topic> topics = Topic.findAllByCreatedByNotEqual(it)
            topics.each {
                Subscription subscription = new Subscription()
                subscription.seriousness(Seriousness.VerySerious)
                subscription.setCreatedBy(user)
                subscription.setTopic(it)
                subscription.validate()
                log.error(subscription.errors.allErrors)
                subscription.save()
            }

        }


    }


    def createResource() {


        User normal = new User()
        normal.setEmailId("chunks@gmail.com")
        normal.setFirstName("chunks")
        normal.setPassword("abcdg")
        normal.setLastName("gupta")
        normal.setUserName("chunky")
        normal.setActive(true)
        normal.setAdmin(false)
        println normal.save(validate: false)


        Topic topic = new Topic()
        topic.setVisibility(Visibility.Private)
        topic.setName("topic name")
        topic.setCreatedBy(normal)
        topic.save()

        if (Resource.count == 0) {

            List<Topic> topics = Topic.getAll()


            topics.each {

                Topic myTopic = it
                Resource linkResource = new LinkResource(url: "https://www.google.co.in/", description: "Description ", topic: myTopic, createdBy: myTopic.createdBy)
                linkResource.validate()
                log.error("Resource Error: ${linkResource.errors.allErrors}")
                linkResource.save()

                Resource documentResource = new DocumentResouce(filePath: "file Path", description: "DEXKNDJVSK", createdBy: myTopic.createdBy, topic: myTopic)
                documentResource.validate()
                log.error("Resource Error: ${documentResource.errors.allErrors}")
                documentResource.save()
            }

        }

    }

    // =================Create Resource
    def createTopic() {

        List<User> users = User.getAll()
        users.each {
            Integer count = Topic.countByCreatedBy(it)
            User user = it
            if (count == 0) {
                5.times {
                    Topic topic = new Topic()
                    topic.setVisibility(Visibility.Private)
                    topic.setName("topic ${it}")
                    topic.setCreatedBy(user)
                    topic.save()
                }
            }
        }
    }
// End Creating

//            Ques first And Second

    def addNormalAndAdmin() {

        User normal = new User()
        normal.setEmailId("chunks@gmail.com")
        normal.setFirstName("chunks")
        normal.setPassword("abcdg")
        normal.setLastName("gupta")
        normal.setUserName("chunky")
        normal.setActive(true)
        normal.setAdmin(false)
        normal.save(flush: true)

        User admin = new User()
        admin.setEmailId("chunky@gmail.com")
        admin.setFirstName("chunky")
        admin.setPassword("abcdg")
        admin.setLastName("gupta")
        admin.setUserName("chunkyGupta")
        admin.setActive(true)
        admin.setAdmin(true)
        admin.save(failOnError: true)

    }


    def destroy = {
    }
}
