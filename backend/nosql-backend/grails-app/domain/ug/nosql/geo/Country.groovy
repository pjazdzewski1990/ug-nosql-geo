package ug.nosql.geo

class Country {

	String name 
	List<Double> center = [0.0d, 0.0d]
	List<Double> border = [ 
		0.0d, 0.0d,
		0.0d, 0.0d
	]
	Map<String, Object> data = [
		"capital": "-||-",
		"population": -1,
		"area": -1
	]
	
    static constraints = { }
}
