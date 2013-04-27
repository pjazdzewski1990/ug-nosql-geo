import ug.nosql.geo.Country

class BootStrap {

    def init = { servletContext ->

        def poland = new Country(name: "Polska")
		poland.center = [11.0d, 12.0d]
		poland.border = [
			11.0d, 12.0d,
			21.0d, 22.0d
		]  
		poland.data = [
			capital: "Warszawa",
			population: 100000,
			area: 20000
		]
		poland.save(failOnError:true)
		
    }
    def destroy = {
    }
}
