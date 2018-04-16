package bootcamp

class ReadingItem {

    Boolean isRead
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User, resource: Resource]

    static constraints = {
        user(nullable: false)
        resource(blank: false, nullable: false)
        isRead(nullable: false)
    }
}
