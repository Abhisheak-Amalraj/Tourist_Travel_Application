//Models from external sources
//resource:https://stackoverflow.com/questions/57726838/getting-random-android-database-sqlite-sqliteblobtoobigexception

class LocationVo {
  LocationVo({
    this.location,
    this.accuracy,
  });

  LocationVo.fromJson(dynamic json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    accuracy = json['accuracy'];
  }

  Location? location;
  num? accuracy;

  LocationVo copyWith({
    Location? location,
    num? accuracy,
  }) =>
      LocationVo(
        location: location ?? this.location,
        accuracy: accuracy ?? this.accuracy,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['accuracy'] = accuracy;
    return map;
  }
}

/// lat : 38.9847719
/// lng : -77.5619419

class Location {
  Location({
    this.lat,
    this.lng,
  });

  Location.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  num? lat;
  num? lng;

  Location copyWith({
    num? lat,
    num? lng,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
