package grailsdomainassignment

import bootcamp.User

class AdminController {

    def userList() {

        def max = params.max ?: 3
        def offset = params.offset ?: 0
        List<User> users = User.list(max: max, offset: offset)

        render(view: '/admin/UsersList', model: [user1: users, total: users.size()])
    }

}
