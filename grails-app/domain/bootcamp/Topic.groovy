package bootcamp

import constant.Visibility

class Topic {

    String name
    static belongsTo = [createdBy: User]
    Date dateCreated
    Date lastUpdated

    Visibility visibility

    static constraints = {

        name(unique: 'createdBy', blank: false, nullable: false)
        visibility(nullable: true)
        createdBy(nullable: false)

    }
}
