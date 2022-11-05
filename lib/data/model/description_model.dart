/// flavor_text_entries : [{"flavor_text":"A strange seed was\nplanted on its\nback at birth.\fThe plant sprouts\nand grows with\nthis POKéMON.","language":{"name":"en","url":"https://pokeapi.co/api/v2/language/9/"}}]

class DescriptionModel {
  DescriptionModel({
      List<FlavorTextEntries>? flavorTextEntries,}){
    _flavorTextEntries = flavorTextEntries;
}

  DescriptionModel.fromJson(dynamic json) {
    if (json['flavor_text_entries'] != null) {
      _flavorTextEntries = [];
      json['flavor_text_entries'].forEach((v) {
        _flavorTextEntries?.add(FlavorTextEntries.fromJson(v));
      });
    }
  }
  List<FlavorTextEntries>? _flavorTextEntries;
DescriptionModel copyWith({  List<FlavorTextEntries>? flavorTextEntries,
}) => DescriptionModel(  flavorTextEntries: flavorTextEntries ?? _flavorTextEntries,
);
  List<FlavorTextEntries>? get flavorTextEntries => _flavorTextEntries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_flavorTextEntries != null) {
      map['flavor_text_entries'] = _flavorTextEntries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// flavor_text : "A strange seed was\nplanted on its\nback at birth.\fThe plant sprouts\nand grows with\nthis POKéMON."
/// language : {"name":"en","url":"https://pokeapi.co/api/v2/language/9/"}

class FlavorTextEntries {
  FlavorTextEntries({
      String? flavorText, 
      Language? language,}){
    _flavorText = flavorText;
    _language = language;
}

  FlavorTextEntries.fromJson(dynamic json) {
    _flavorText = json['flavor_text'];
    _language = json['language'] != null ? Language.fromJson(json['language']) : null;
  }
  String? _flavorText;
  Language? _language;
FlavorTextEntries copyWith({  String? flavorText,
  Language? language,
}) => FlavorTextEntries(  flavorText: flavorText ?? _flavorText,
  language: language ?? _language,
);
  String? get flavorText => _flavorText;
  Language? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flavor_text'] = _flavorText;
    if (_language != null) {
      map['language'] = _language?.toJson();
    }
    return map;
  }

}

/// name : "en"
/// url : "https://pokeapi.co/api/v2/language/9/"

class Language {
  Language({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Language.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Language copyWith({  String? name,
  String? url,
}) => Language(  name: name ?? _name,
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