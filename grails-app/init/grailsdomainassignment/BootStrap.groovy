package grailsdomainassignment

import bootcamp.DocumentResouce
import bootcamp.LinkResource
import bootcamp.RatingResource
import bootcamp.ReadingItem
import bootcamp.Resource
import bootcamp.Subscription
import bootcamp.Topic
import bootcamp.User
import commandobject.ResourceSearchCo
import constant.Seriousness
import constant.Visibility
import utilities.AppConstants

class BootStrap {

    def init = { servletContext ->

        println AppConstants.PASSWORD

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
//            println normal.save(validate: false)
//
//        }
//
//        User normal = new User()
//        normal.setEmailId("chunks@gmail.com")
//        normal.setFirstName("chunks")
//        normal.setPassword("abcdg")
//        normal.setLastName("gupta")
//        normal.setUserName("chunky")
//        normal.setActive(true)
//        normal.setAdmin(false)
//        normal.validate()
//        println normal.save(validate: false)

//        User user = User.get(1)

//        println user.getUserName()

//        Topic topic = new Topic()
//        topic.setVisibility(Visibility.Public)
//        topic.setName("topicName")
//        topic.setCreatedBy(normal)
//        println topic.save()

//
        addNormalAndAdmin()
        createTopic()
        createResource()
        subscribeTopics()
//        createResourceRating()
//        question27()
        List<User> userList = User.getAll()
        userList.each {
            println it.firstName
        }

        creatingReadingItems()


//        println(userList.first().getSubscribedTopics())

        //Question 1 for gorm 2
//        ResourceSearchCo resourceSearchCo = new ResourceSearchCo(topicId: 1)
//        List<Resource> resourceList = Resource.search(resourceSearchCo).list()
//        resourceList.each {
//            println("---------------------" + it.description)
//        }

        println("--------------------------")
        println Topic.getTrendingTopic().name

//        createReadingItemIfItDoesNotExistsInUsersReadingItem()
    }

    void createResourceRating() {

        List<User> userList = User.getAll()
        userList.each {
            User user ->
                user.readingItem.each {
                    if (!it.isRead && RatingResource.findAllByUser(user).size() == 0) {
                        RatingResource resourceRating = new RatingResource(user: user, resource: it.resource, score: 4)
                        resourceRating.validate()
                        if (resourceRating.save()) {
                            log.info("Saved Successfully")
                            user.save()
                        } else {
                            log.error("${resourceRating.errors.getAllErrors()}")
                        }
                    }
                }

        }

    }

//Question24 Reading item of resource should be created only if it does not already exist in users reading item
//    void createReadingItemIfItDoesNotExistsInUsersReadingItem(User user, Topic topic) {
//        topic.resources.each {
//            ReadingItem readingItem = new ReadingItem(user: user, resource: it, isRead: false)
//            if (readingItem.save()) {
//                it.addToReadingItems(readingItem)
//                it.save()
//                user.save()
//            } else {
//                log.error("Error: ${readingItem.errors.getAllErrors()}")
//            }
//        }
//    }
//Question27 createdBy of resourcerating should be createdby of reading item and resource of resourcerating should be resource of readingitem
    void question27() {
        List<RatingResource> resourceRatingList = RatingResource.getAll()
        resourceRatingList.each {
            RatingResource resourceRating ->
                if (ReadingItem.findAllByUserAndResource(resourceRating.user, resourceRating.resource).size() == 0) {
                    ReadingItem readingItem = new ReadingItem(user: resourceRating.user, resource: resourceRating.resource, isRead: false)
                    if (readingItem.save()) {
                        log.info("Saved Successfully")
                        resourceRating.resource.addToReadingItems(readingItem)
                        resourceRating.resource.save()
                        resourceRating.user.save()
                    } else {
                        log.error("Error:- ${readingItem.errors.getAllErrors()}")
                    }
                }
        }
    }

    def creatingReadingItems() {

        List<User> users = User.getAll()
        users.each {
            User user ->
                user.subscriptions.each {
                    it.topic.resources.each {
                        if (it.user != user && ReadingItem.findAllByResourceAndUser(it, user).size() == 0) {
                            ReadingItem readingItem = new ReadingItem(user: user, isRead: true, resource: it)


                            if (!readingItem.save(flush: true)) {
                                log.error("Error while saving : $readingItem")
                            } else {
                                log.info("Saved Succesfully: $readingItem")
                              }

//                            readingItem.save(validate: false)
                        }

                    }
                }
        }


    }


    def subscribeTopics() {

        List<User> users = User.getAll()

        users.each {

            User user = it
            List<Topic> topics = Topic.findAllByCreatedByNotEqual(user)
            println topics

            topics.each {
                if (Subscription.findAllByTopicAndUser(it, user).size() == 0) {
                    Subscription subscription = new Subscription()
                    subscription.setSeriousness(Seriousness.VerySerious)
                    subscription.setUser(user)
                    subscription.setTopic(it)
                    subscription.validate()
                    subscription.validate()
                    log.error("Error:${subscription.errors.getAllErrors()}")
                    println subscription.save()
                }
            }

        }


    }


    def createResource() {


        User normal = new User()
        normal.setEmailId("chunks123456@gmail.com")
        normal.setFirstName("chunks")
        normal.setPassword("abcdg")
        normal.setLastName("gupta")
        normal.setUserName("chunkyGupta123")
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
                Resource linkResource = new LinkResource(url: "https://www.google.co.in/", description: "Description ", topic: myTopic, user: myTopic.createdBy)
                linkResource.validate()
                log.error("Resource Error: ${linkResource.errors.allErrors}")
                linkResource.save()

                Resource documentResource = new DocumentResouce(filePath: "file Path", description: "DEXKNDJVSK", user: myTopic.createdBy, topic: myTopic)
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
                    topic.setName("topic ${it}abc")
                    topic.setCreatedBy(user)

                    println topic.save()
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
