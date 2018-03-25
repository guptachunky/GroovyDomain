package bootcamp

class ReadingItem {

    User createdBy
    Boolean isRead
    Resource resource
    Date dateCreated
    Date dateUpdated

    static belongsTo = [user: User]


    static constraints = {
        createdBy(nullable: false)
        resource(blank: false, nullable: false, unique: 'user')
        isRead(nullable: false)
    }
}
