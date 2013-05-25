//porownaj 2 tablice
Array.prototype.compare = function(b) {
    var a = this;
	if(a.length != b.length) {
		return false;
	}
	for(var i=0; i<a.length; i++) {
		if(b[i] !== a[i]){
			return false;
		}
	}
	return true;
};

//map reduce dla przypisania do powiatow
var map = function() {
	//oddaj id powiatu i punkty graniczne gminy 
	var locations = [];
	for(var i=0; i<this.loc.length){
		locations.concat(this.loc[i]);
	}
	emit(this.powiat_id, locations);
};
var reduce = function(key, val) {
	//paczuejmy array
	//TODO: to powinno byc poza reduce, ale sa jakies problemy z widocznoscia 
	//usun z tablciy wszystkie "NIE-unikalne" wartosci
	Array.prototype.filterUnique = function() {
		var a = this;
		for(var i=0; i<a.length; ++i) {
			var elem = a[i];
			var toDelete = false;
			for(var j=a.length-1; j>i; j--) {
				if(a[j] == elem){
					toDelete = true;
					a.splice(j, 1);
				}
			}
			if(toDelete) {
				a.splice(i, 1);
				i--;
			}
		}
		return a;
	};

	var border = [];
	//zbierz wszystkie punkty, ktore sa unikalne, tj. nie wystepuja 2 razy
	for(var i=0; i<val.length; i++){
		border.concat(val[i]);
	}
	return {data: border.filterUnique()};
};

db.community.mapReduce(
	map,
    reduce,
    { out: "dummy" }
)
