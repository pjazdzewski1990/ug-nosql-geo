package ug.nosql.geo

import java.util.List;

class HelperService {

    def toPairList(List<Double> longList){
		List<List<Double>> result = [];
		
		for(int i=0; i<longList.size(); i+=2){
			result.add([longList.get(i), longList.get(i+1)])
		}
		
		return result  
	}
}
