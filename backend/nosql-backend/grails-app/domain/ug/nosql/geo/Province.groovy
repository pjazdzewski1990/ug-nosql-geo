package ug.nosql.geo

import java.util.List;
import java.util.Map;

class Province {

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
