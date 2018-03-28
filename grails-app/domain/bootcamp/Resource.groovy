package bootcamp

abstract class Resource {

    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User, topic: Topic]

    static hasMany = [ratings: RatingResource, readingItems: ReadingItem]

    static constraints = {
        description(type: 'text')
    }
}
