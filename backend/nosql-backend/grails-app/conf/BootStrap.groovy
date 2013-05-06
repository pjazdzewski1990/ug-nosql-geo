import ug.nosql.geo.Country
import ug.nosql.geo.District
import ug.nosql.geo.Province

class BootStrap {

    def init = { servletContext ->

        createCountry()
		createProvince()
		createDistrict()
    }

	private createDistrict() {
		def g1 = new District(name: "Powiat pierwszy")
		g1.center = [25.0d, 85.0d]
		g1.border = [
			0.0d, 75.0d,
			50.0d, 75.0d,
			50.0d, 100.0d,
			0.0d, 100.0d,
		]
		g1.data = [
			capital: "Powiat pierwszy - siedziba",
			population: 100000,
			area: 20000
		]
		g1.save(failOnError:true)
		
		def g2 = new District(name: "Powiat drugi")
		g2.center = [25.0d, 65.0d]
		g2.border = [
			0.0d, 50.0d,
			50.0d, 50.0d,
			50.0d, 75.0d,
			0.0d, 75.0d,
		]
		g2.data = [
			capital: "Powiat drugi - siedziba",
			population: 100000,
			area: 20000
		]
		g2.save(failOnError:true)
		
		def g3 = new District(name: "Powiat trzeci")
		g3.center = [75.0d, 85.0d]
		g3.border = [
			50.0d, 75.0d,
			100.0d, 75.0d,
			100.0d, 100.0d,
			50.0d, 100.0d,
		]
		g3.data = [
			capital: "Powiat trzeci - siedziba",
			population: 100000,
			area: 20000
		]
		g3.save(failOnError:true)
		
		def g4 = new District(name: "Powiat czwarty")
		g4.center = [75.0d, 70.0d]
		g4.border = [
			50.0d, 50.0d,
			100.0d, 50.0d,
			100.0d, 75.0d,
			50.0d, 75.0d,
		]
		g4.data = [
			capital: "Powiat czwarty - siedziba",
			population: 100000,
			area: 20000
		]
		g4.save(failOnError:true)
		
		def g5 = new District(name: "Powiat piaty")
		g5.center = [25.0d, 40.0d]
		g5.border = [
			0.0d, 25.0d,
			50.0d, 25.0d,
			50.0d, 50.0d,
			0.0d, 50.0d,
		]
		g5.data = [
			capital: "Powiat piaty - siedziba",
			population: 100000,
			area: 20000
		]
		g5.save(failOnError:true)
		
		def g6 = new District(name: "Powiat szesc")
		g6.center = [25.0d, 10.0d]
		g6.border = [
			0.0d, 0.0d,
			50.0d, 0.0d,
			50.0d, 25.0d,
			0.0d, 25.0d,
		]
		g6.data = [
			capital: "Powiat szesc - siedziba",
			population: 100000,
			area: 20000
		]
		g6.save(failOnError:true)
		
		def g7 = new District(name: "Powiat siedem")
		g7.center = [75.0d, 40.0d]
		g7.border = [
			50.0d, 50.0d,
			100.0d, 50.0d,
			100.0d, 50.0d,
			50.0d, 50.0d,
		]
		g7.data = [
			capital: "Powiat siedem - siedziba",
			population: 100000,
			area: 20000
		]
		g7.save(failOnError:true)
		
		def g8 = new District(name: "Powiat osmy")
		g8.center = [75.0d, 10.0d]
		g8.border = [
			50.0d, 0.0d,
			100.0d, 0.0d,
			100.0d, 25.0d,
			50.0d, 25.0d,
		]
		g8.data = [
			capital: "Powiat osiem - siedziba",
			population: 100000,
			area: 20000
		]
		g8.save(failOnError:true)
	}
	
	private createProvince() {
		def pomorskie = new Province(name: "Pomorskie")
		pomorskie.center = [25.0d, 75.0d]
		pomorskie.border = [
			0.0d, 50.0d,
			50.0d, 50.0d,
			50.0d, 100.0d,
			0.0d, 100.0d,
		]
		pomorskie.data = [
			capital: "Gdansk",
			population: 100000,
			area: 20000
		]
		pomorskie.save(failOnError:true)
		
		def mazowieckie = new Province(name: "Mazowieckie")
		mazowieckie.center = [75.0d, 75.0d]
		mazowieckie.border = [
			50.0d, 50.0d,
			100.0d, 50.0d,
			100.0d, 100.0d,
			50.0d, 100.0d,
		]
		mazowieckie.data = [
			capital: "Warszawa",
			population: 100000,
			area: 20000
		]
		mazowieckie.save(failOnError:true)
		
		def malopolskie = new Province(name: "Malopolskie")
		malopolskie.center = [25.0d, 25.0d]
		malopolskie.border = [
			0.0d, 0.0d,
			0.0d, 50.0d,
			50.0d, 50.0d,
			0.0d, 50.0d,
		]
		malopolskie.data = [
			capital: "Krakow",
			population: 100000,
			area: 20000
		]
		malopolskie.save(failOnError:true)
		
		def podkarpackie = new Province(name: "Podkarpackie")
		podkarpackie.center = [75.0d, 25.0d]
		podkarpackie.border = [
			50.0d, 0.0d,
			100.0d, 0.0d,
			100.0d, 50.0d,
			50.0d, 50.0d,
		]
		podkarpackie.data = [
			capital: "Podobno Rzeszow",
			population: 100000,
			area: 20000
		]
		podkarpackie.save(failOnError:true)
	}
	
	private createCountry() {
		def poland = new Country(name: "Polska")
		poland.center = [50.0d, 50.0d]
		poland.border = [
			0.0d, 0.0d,
			100.0d, 0.0d,
			0.0d, 100.0d,
			100.0d, 100.0d,
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
