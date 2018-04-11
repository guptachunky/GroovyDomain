package grailsdomainassignment

import bootcamp.Subscription
import bootcamp.User

class AwaiController {

    def index() {

//        User user = User.get(4)
//       src="data:image/png;base64,${session.user?.photo.encodeBase64()} "

//        Byte[] photo = user.photo
//        render text: "${session.user?.photo.encodeBase64()}", contentType: 'image/jpeg'

//        render(view: "myView")

//        List<User> userList = User.getAll()

        List<Subscription> subscriptions = Subscription.getAll()

        render(view: "myView")

//        redirect(view: "/awai/myView")


    }

}
