package utilities

import bootcamp.User
import org.apache.commons.lang.RandomStringUtils

class Util {

    String getRandomPassword() {

        int randomStringLength = 6
        String charset = (('a'..'z') + ('A'..'Z') + ('0'..'9')).join()
        String randomString = RandomStringUtils.random(randomStringLength, charset.toCharArray())
        User user = User.findByPassword(randomString)
        if (user) {
            getRandomPassword()
        } else
            randomString
    }
}
