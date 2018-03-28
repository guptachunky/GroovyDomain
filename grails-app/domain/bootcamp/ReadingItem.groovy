package bootcamp

class ReadingItem {

    Boolean isRead
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User, resource: Resource]


    static constraints = {
        user(nullable: false, unique: "resource")
        resource(blank: false, nullable: false, unique: 'user')
        isRead(nullable: false)
    }
}
