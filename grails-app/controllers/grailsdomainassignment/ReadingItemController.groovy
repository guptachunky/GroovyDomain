package grailsdomainassignment

import bootcamp.ReadingItem

class ReadingItemController {

    def index() {}

    def changeIsRead(Long id, Boolean isRead) {
        if (ReadingItem.executeUpdate("update readingItem set isRead=:isRead where id=:id", [isRead: isRead, id: id]) == 0) {
            render("error")
        } else
            render("success")
    }
}
