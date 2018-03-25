package bootcamp

class Resource {

    User createdBy
    Topic topic
    String description
    Date dateCreated
    Date dateUpdated

    static belongsTo = [user: User]
    static hasMany = [ratings: RatingResource, readingItems: ReadingItem]
    static constraints = {
    }
}
