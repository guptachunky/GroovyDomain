package commandobject

import bootcamp.User

import java.beans.Visibility

class ResourceSearchCo extends SearchCo {
    Long topicId
    Visibility visibility
    Integer id


    User getUser() {
        return User.get(this.id)

    }
}
