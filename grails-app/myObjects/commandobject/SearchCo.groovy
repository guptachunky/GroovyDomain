package commandobject

import grails.validation.Validateable

class SearchCo implements Validateable{

    String q
    Integer max
    Integer offset
    String order
    String sort

}
