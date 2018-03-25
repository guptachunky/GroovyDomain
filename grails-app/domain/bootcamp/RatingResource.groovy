package bootcamp

class RatingResource {

    Resource resource
    User createdBy
    Integer score
    Date dateCreated
    Date dateUpdated
    static constraints = {
        resource(nullable: false)
        createdBy(nullable: false)
        score(nullable: false , min: 1,max: 5)

    }
}
