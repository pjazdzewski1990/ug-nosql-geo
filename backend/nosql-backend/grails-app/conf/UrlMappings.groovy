class UrlMappings {

	static mappings = {
		"/geo/country/$id?"(controller: "country", action: "get")
		"/geo/province/$id?"(controller: "province", action: "get")
		"/geo/district/$id?"(controller: "district", action: "get")
		"/geo/community/$id?"(controller: "community", action: "get")
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
        /**
         * Spring Security Controller Mappings
         */
        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        /**
         * HTTP Error redirects
         */
        "500"(view:'/error')
		
		"/"(view:'/index')
	}
}
