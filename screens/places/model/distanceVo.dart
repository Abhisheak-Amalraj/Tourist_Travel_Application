//Models from external sources
//resource:https://stackoverflow.com/questions/57726838/getting-random-android-database-sqlite-sqliteblobtoobigexception

class DistanceVo {
  DistanceVo({
    this.destinationAddresses,
    this.originAddresses,
    this.rows,
    this.status,
  });

  DistanceVo.fromJson(dynamic json) {
    destinationAddresses = json['destination_addresses'] != null
        ? json['destination_addresses'].cast<String>()
        : [];
    originAddresses = json['origin_addresses'] != null
        ? json['origin_addresses'].cast<String>()
        : [];
    if (json['rows'] != null) {
      rows = [];
      json['rows'].forEach((v) {
        rows?.add(Rows.fromJson(v));
      });
    }
    status = json['status'];
  }

  List<String>? destinationAddresses;
  List<String>? originAddresses;
  List<Rows>? rows;
  String? status;
  String? plateId;

  DistanceVo copyWith({
    List<String>? destinationAddresses,
    List<String>? originAddresses,
    List<Rows>? rows,
    String? status,
  }) =>
      DistanceVo(
        destinationAddresses: destinationAddresses ?? this.destinationAddresses,
        originAddresses: originAddresses ?? this.originAddresses,
        rows: rows ?? this.rows,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['destination_addresses'] = destinationAddresses;
    map['origin_addresses'] = originAddresses;
    if (rows != null) {
      map['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }
}


class Rows {
  Rows({
    this.elements,
  });

  Rows.fromJson(dynamic json) {
    if (json['elements'] != null) {
      elements = [];
      json['elements'].forEach((v) {
        elements?.add(Elements.fromJson(v));
      });
    }
  }

  List<Elements>? elements;

  Rows copyWith({
    List<Elements>? elements,
  }) =>
      Rows(
        elements: elements ?? this.elements,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (elements != null) {
      map['elements'] = elements?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Elements {
  Elements({
    this.distance,
    this.duration,
    this.status,
  });

  Elements.fromJson(dynamic json) {
    distance =
        json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    duration =
        json['duration'] != null ? Duration.fromJson(json['duration']) : null;
    status = json['status'];
  }

//string used to store distance and duration.
  Distance? distance;
  Duration? duration;
  String? status;

  Elements copyWith({
    Distance? distance,
    Duration? duration,
    String? status,
  }) =>
      Elements(
        distance: distance ?? this.distance,
        duration: duration ?? this.duration,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (distance != null) {
      map['distance'] = distance?.toJson();
    }
    if (duration != null) {
      map['duration'] = duration?.toJson();
    }
    map['status'] = status;
    return map;
  }
}

class Duration {
  Duration({
    this.text,
    this.value,
  });

  Duration.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
  }

  String? text;
  num? value;

  Duration copyWith({
    String? text,
    num? value,
  }) =>
      Duration(
        text: text ?? this.text,
        value: value ?? this.value,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    return map;
  }
}


class Distance {
  Distance({
    this.text,
    this.value,
  });

  Distance.fromJson(dynamic json) {
    text = json['text'];
    value = json['value'];
  }

  String? text;
  num? value;

  Distance copyWith({
    String? text,
    num? value,
  }) =>
      Distance(
        text: text ?? this.text,
        value: value ?? this.value,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['value'] = value;
    return map;
  }
}
