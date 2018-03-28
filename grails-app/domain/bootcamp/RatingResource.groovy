package bootcamp

class RatingResource {

    Integer score
    Date dateCreated
    Date lastUpdated
    static belongsTo = [user: User, resource: Resource]
    static constraints = {
        resource(nullable: false)
        user(nullable: false)
        score(validator: {
            return it >= 1 && it <= 5
        })
    }
}
