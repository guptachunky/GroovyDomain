package grailsdomainassignment

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/login/index")
        "500"(view: '/LinkSharingError')
        "404"(view: '/pageNotFound')

    }
}
