package commandobject

import bootcamp.User
import constant.Visibility

class TopicSearchCO {

    Visibility visibility
    Integer id


    User getUser() {
        return User.get(this.id)
    }


}
