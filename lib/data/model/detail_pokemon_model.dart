/// id : 1
/// name : "bulbasaur"
/// weight : 69
/// height : 70
/// types : [{"slot":1,"type":{"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}},{"slot":2,"type":{"name":"poison","url":"https://pokeapi.co/api/v2/type/4/"}}]
/// stats : [{"base_stat":45,"effort":0,"stat":{"name":"hp","url":"https://pokeapi.co/api/v2/stat/1/"}}]

class DetailPokemonModel {
  DetailPokemonModel({
      num? id, 
      String? name, 
      num? weight, 
      num? height, 
      List<Types>? types, 
      List<Stats>? stats,}){
    _id = id;
    _name = name;
    _weight = weight;
    _height = height;
    _types = types;
    _stats = stats;
}

  DetailPokemonModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _weight = json['weight'];
    _height = json['height'];
    if (json['types'] != null) {
      _types = [];
      json['types'].forEach((v) {
        _types?.add(Types.fromJson(v));
      });
    }
    if (json['stats'] != null) {
      _stats = [];
      json['stats'].forEach((v) {
        _stats?.add(Stats.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  num? _weight;
  num? _height;
  List<Types>? _types;
  List<Stats>? _stats;
DetailPokemonModel copyWith({  num? id,
  String? name,
  num? weight,
  num? height,
  List<Types>? types,
  List<Stats>? stats,
}) => DetailPokemonModel(  id: id ?? _id,
  name: name ?? _name,
  weight: weight ?? _weight,
  height: height ?? _height,
  types: types ?? _types,
  stats: stats ?? _stats,
);
  num? get id => _id;
  String? get name => _name;
  num? get weight => _weight;
  num? get height => _height;
  List<Types>? get types => _types;
  List<Stats>? get stats => _stats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['weight'] = _weight;
    map['height'] = _height;
    if (_types != null) {
      map['types'] = _types?.map((v) => v.toJson()).toList();
    }
    if (_stats != null) {
      map['stats'] = _stats?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// base_stat : 45
/// effort : 0
/// stat : {"name":"hp","url":"https://pokeapi.co/api/v2/stat/1/"}

class Stats {
  Stats({
      num? baseStat, 
      num? effort, 
      Stat? stat,}){
    _baseStat = baseStat;
    _effort = effort;
    _stat = stat;
}

  Stats.fromJson(dynamic json) {
    _baseStat = json['base_stat'];
    _effort = json['effort'];
    _stat = json['stat'] != null ? Stat.fromJson(json['stat']) : null;
  }
  num? _baseStat;
  num? _effort;
  Stat? _stat;
Stats copyWith({  num? baseStat,
  num? effort,
  Stat? stat,
}) => Stats(  baseStat: baseStat ?? _baseStat,
  effort: effort ?? _effort,
  stat: stat ?? _stat,
);
  num? get baseStat => _baseStat;
  num? get effort => _effort;
  Stat? get stat => _stat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['base_stat'] = _baseStat;
    map['effort'] = _effort;
    if (_stat != null) {
      map['stat'] = _stat?.toJson();
    }
    return map;
  }

}

/// name : "hp"
/// url : "https://pokeapi.co/api/v2/stat/1/"

class Stat {
  Stat({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Stat.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Stat copyWith({  String? name,
  String? url,
}) => Stat(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}

/// slot : 1
/// type : {"name":"grass","url":"https://pokeapi.co/api/v2/type/12/"}

class Types {
  Types({
      num? slot, 
      Type? type,}){
    _slot = slot;
    _type = type;
}

  Types.fromJson(dynamic json) {
    _slot = json['slot'];
    _type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }
  num? _slot;
  Type? _type;
Types copyWith({  num? slot,
  Type? type,
}) => Types(  slot: slot ?? _slot,
  type: type ?? _type,
);
  num? get slot => _slot;
  Type? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slot'] = _slot;
    if (_type != null) {
      map['type'] = _type?.toJson();
    }
    return map;
  }

}

/// name : "grass"
/// url : "https://pokeapi.co/api/v2/type/12/"

class Type {
  Type({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Type.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Type copyWith({  String? name,
  String? url,
}) => Type(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}