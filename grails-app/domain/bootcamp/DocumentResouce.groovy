package bootcamp

class DocumentResouce extends Resource {

    String filePath
    Date dateCreated
    Date lastUpdated

    String contentType
    static transients = ['contentType']
    static constraints = {

    }
}
