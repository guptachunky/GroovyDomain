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
        addNormalAndAdmin()
        createTopic()
        createResource()
        subscribeTopics()
        creatingReadingItems()
        createResourceRating()
//        question27()

        List<User> userList = User.findAll()

//        userList.each {
//            User user=it
//            it.readingItem.each {
//                println("${user.userName}=====================================${it}")
//            }
//
//        }

//        List<Topic> topics = Topic.findAll()
//        topics.each {
//            println it.name
//        }

//        println(userList.first().getSubscribedTopics())
        //Question 1 for gorm 2
//        ResourceSearchCo resourceSearchCo = new ResourceSearchCo(topicId: 1)
//        List<Resource> resourceList = Resource.search(resourceSearchCo).list()
//        resourceList.each {
//            println("---------------------" + it.description)
//        }

//        println("--------------------------")
//        println Topic.getTrendingTopic().name

    }


    def creatingReadingItems() {

        List<User> userList = User.findAll()
        userList.each {
            List<Resource> resourceList = Resource.findAll()
            User user = it
            resourceList.each {

                Topic topic = it.topic
                if (topic.createdBy != user && it.user != user) {

                    ReadingItem readingItem = new ReadingItem(user: user, isRead: true, resource: it)
                    if (!readingItem.save(flush: true)) {
                        log.error("Error while saving : $readingItem")
                    } else {
                        log.info("Saved Succesfully: $readingItem")
                        user.addToReadingItem(readingItem)
                    }
                }
            }
        }

    }


    void createResourceRating() {

        Random random = new Random()
        List<ReadingItem> readingItemList = ReadingItem.findAll()
        println readingItemList.size()
        readingItemList.each {
            if (it.isRead) {
                RatingResource resourceRating = new RatingResource(resource: it.resource, user: it.user, score: random.nextInt(6))
                if (!resourceRating.save(flush: true)) {
                    log.error("Error while saving : $resourceRating")
                    resourceRating.errors.allErrors.each { println it }
                } else
                    log.info("Saved Successfully : $resourceRating")
            }
        }

//
//        List<User> userList = User.getAll()
//        userList.each {
//            User user ->
//                user.readingItem.each {
//                    if (!it.isRead && RatingResource.findAllByUser(user).size() == 0) {
//                        RatingResource resourceRating = new RatingResource(user: user, resource: it.resource, score: 4)
//                        resourceRating.validate()
//                        if (resourceRating.save(flush: true)) {
//                            log.info("Saved Successfully")
//                            user.save(flush: true)
//                        } else {
//                            log.error("${resourceRating.errors.getAllErrors()}")
//                        }
//                    }
//                }
//
//        }

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
                    if (readingItem.save(flush: true)) {
                        log.info("Saved Successfully")
                        resourceRating.resource.addToReadingItems(readingItem)
                        resourceRating.resource.save(flush: true)
                        resourceRating.user.save(flush: true)
                    } else {
                        log.error("Error:- ${readingItem.errors.getAllErrors()}")
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
                    subscription.save(flush: true)
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
        println normal.save(validate: false, flush: true)


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
                linkResource.save(flush: true)
                it.addToResources(linkResource)
                it.createdBy.addToResources(linkResource)

                Resource documentResource = new DocumentResouce(filePath: "file Path", description: "DEXKNDJVSK", user: myTopic.createdBy, topic: myTopic)
                documentResource.validate()
                documentResource.save(flush: true)
                it.addToResources(documentResource)
                it.createdBy.addToResources(documentResource)

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
                    topic.setVisibility(Visibility.Public)
                    topic.setName("topic by ${user.userName}  ${it}abc")
                    topic.setCreatedBy(user)

                    println topic.save(flush: true)
                }
            }
        }
    }
// End Creating

//            Ques first And Second

    def addNormalAndAdmin() {

        User normal = new User()
        normal.setEmailId("chunkygupta95@gmail.com")
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
        admin.save(flush: true)

    }


    def destroy = {
    }
}
