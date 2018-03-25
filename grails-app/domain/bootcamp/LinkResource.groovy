package bootcamp

class LinkResource {

    String url
    Date dateCreated
    Date dateUpdated
    static constraints = {
        url(url: true)
    }
}
