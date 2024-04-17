import 'package:yttravel/screens/places/model/distanceVo.dart';

//Models from external sources
//resource:https://stackoverflow.com/questions/57726838/getting-random-android-database-sqlite-sqliteblobtoobigexception

class PlateVo {
  PlateVo({
    this.htmlAttributions,
    this.nextPageToken,
    this.results,
    this.status,
  });

  PlateVo.fromJson(dynamic json) {
    if (json['html_attributions'] != null) {
      htmlAttributions = [];
      json['html_attributions'].forEach((v) {
        htmlAttributions?.add(v);
      });
    }
    nextPageToken = json['next_page_token'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    status = json['status'];
  }

  List<String>? htmlAttributions;
  String? nextPageToken;
  List<Results>? results;
  String? status;

  PlateVo copyWith({
    List<String>? htmlAttributions,
    String? nextPageToken,
    List<Results>? results,
    String? status,
  }) =>
      PlateVo(
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        nextPageToken: nextPageToken ?? this.nextPageToken,
        results: results ?? this.results,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (htmlAttributions != null) {
      map['html_attributions'] = htmlAttributions?.map((v) => v).toList();
    }
    map['next_page_token'] = nextPageToken;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }
}


class Results {
  Results({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
  });

  Results.fromJson(dynamic json) {
    businessStatus = json['business_status'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    name = json['name'];
    openingHours = json['opening_hours'] != null
        ? OpeningHours.fromJson(json['opening_hours'])
        : null;
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    plusCode =
        json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null;
    priceLevel = json['price_level'];
    rating = json['rating'];
    reference = json['reference'];
    scope = json['scope'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
    userRatingsTotal = json['user_ratings_total'];
    vicinity = json['vicinity'];
  }

  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  List<Photos>? photos;
  String? placeId;
  PlusCode? plusCode;
  num? priceLevel;
  num? rating;
  String? reference;
  String? scope;
  List<String>? types;
  num? userRatingsTotal;
  String? vicinity;

  Results copyWith({
    String? businessStatus,
    Geometry? geometry,
    String? icon,
    String? iconBackgroundColor,
    String? iconMaskBaseUri,
    String? name,
    OpeningHours? openingHours,
    List<Photos>? photos,
    String? placeId,
    PlusCode? plusCode,
    num? priceLevel,
    num? rating,
    String? reference,
    String? scope,
    List<String>? types,
    num? userRatingsTotal,
    String? vicinity,
  }) =>
      Results(
        businessStatus: businessStatus ?? this.businessStatus,
        geometry: geometry ?? this.geometry,
        icon: icon ?? this.icon,
        iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
        iconMaskBaseUri: iconMaskBaseUri ?? this.iconMaskBaseUri,
        name: name ?? this.name,
        openingHours: openingHours ?? this.openingHours,
        photos: photos ?? this.photos,
        placeId: placeId ?? this.placeId,
        plusCode: plusCode ?? this.plusCode,
        priceLevel: priceLevel ?? this.priceLevel,
        rating: rating ?? this.rating,
        reference: reference ?? this.reference,
        scope: scope ?? this.scope,
        types: types ?? this.types,
        userRatingsTotal: userRatingsTotal ?? this.userRatingsTotal,
        vicinity: vicinity ?? this.vicinity,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['business_status'] = businessStatus;
    if (geometry != null) {
      map['geometry'] = geometry?.toJson();
    }
    map['icon'] = icon;
    map['icon_background_color'] = iconBackgroundColor;
    map['icon_mask_base_uri'] = iconMaskBaseUri;
    map['name'] = name;
    if (openingHours != null) {
      map['opening_hours'] = openingHours?.toJson();
    }
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['place_id'] = placeId;
    if (plusCode != null) {
      map['plus_code'] = plusCode?.toJson();
    }
    map['price_level'] = priceLevel;
    map['rating'] = rating;
    map['reference'] = reference;
    map['scope'] = scope;
    map['types'] = types;
    map['user_ratings_total'] = userRatingsTotal;
    map['vicinity'] = vicinity;
    return map;
  }

  @override
  String toString() {
    return 'Results{businessStatus: $businessStatus, geometry: $geometry, icon: $icon, iconBackgroundColor: $iconBackgroundColor, iconMaskBaseUri: $iconMaskBaseUri, name: $name, openingHours: $openingHours, photos: $photos, placeId: $placeId, plusCode: $plusCode, priceLevel: $priceLevel, rating: $rating, reference: $reference, scope: $scope, types: $types, userRatingsTotal: $userRatingsTotal, vicinity: $vicinity}';
  }
}

/// compound_code : "2F4G+R2 Zhonghe District, New Taipei City, Taiwan"
/// global_code : "7QQ32F4G+R2"

class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  PlusCode.fromJson(dynamic json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }

  String? compoundCode;
  String? globalCode;

  PlusCode copyWith({
    String? compoundCode,
    String? globalCode,
  }) =>
      PlusCode(
        compoundCode: compoundCode ?? this.compoundCode,
        globalCode: globalCode ?? this.globalCode,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compound_code'] = compoundCode;
    map['global_code'] = globalCode;
    return map;
  }
}

/// height : 2241
/// html_attributions : ["<a href=\"https://maps.google.com/maps/contrib/114392657411751488452\">GH Chen</a>"]
/// photo_reference : "AZose0klhBcN1odqWHsA_lwCLaD12VdBcMWY_4bjKz6IdPU7tSo5xTna9g7TG7CBlQoxy8RHKOtoU0nGm3k0f7Ild7GsKz-gPCAlYdned73N5hLS5fkeMj0N3-lTtvkBZaHZcYMrBayk4rmJkAA2bNvJbob3omNPJ-25QDb4348huwCUmRMd"
/// width : 3984

class Photos {
  Photos({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  Photos.fromJson(dynamic json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'] != null
        ? json['html_attributions'].cast<String>()
        : [];
    photoReference = json['photo_reference'];
    width = json['width'];
  }

  num? height;
  List<String>? htmlAttributions;
  String? photoReference;
  num? width;

  Photos copyWith({
    num? height,
    List<String>? htmlAttributions,
    String? photoReference,
    num? width,
  }) =>
      Photos(
        height: height ?? this.height,
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        photoReference: photoReference ?? this.photoReference,
        width: width ?? this.width,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['html_attributions'] = htmlAttributions;
    map['photo_reference'] = photoReference;
    map['width'] = width;
    return map;
  }

  @override
  String toString() {
    return 'Photos{height: $height, htmlAttributions: $htmlAttributions, photoReference: $photoReference, width: $width}';
  }
}

/// open_now : true

class OpeningHours {
  OpeningHours({
    this.openNow,
  });

  OpeningHours.fromJson(dynamic json) {
    openNow = json['open_now'];
  }

  bool? openNow;

  OpeningHours copyWith({
    bool? openNow,
  }) =>
      OpeningHours(
        openNow: openNow ?? this.openNow,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open_now'] = openNow;
    return map;
  }
}

/// location : {"lat":25.0070544,"lng":121.4751039}
/// viewport : {"northeast":{"lat":25.0084162802915,"lng":121.4765614302915},"southwest":{"lat":25.0057183197085,"lng":121.4738634697085}}

class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  Geometry.fromJson(dynamic json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    viewport =
        json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }

  Location? location;
  Viewport? viewport;

  Geometry copyWith({
    Location? location,
    Viewport? viewport,
  }) =>
      Geometry(
        location: location ?? this.location,
        viewport: viewport ?? this.viewport,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (viewport != null) {
      map['viewport'] = viewport?.toJson();
    }
    return map;
  }
}

/// northeast : {"lat":25.0084162802915,"lng":121.4765614302915}
/// southwest : {"lat":25.0057183197085,"lng":121.4738634697085}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  Viewport.fromJson(dynamic json) {
    northeast = json['northeast'] != null
        ? Northeast.fromJson(json['northeast'])
        : null;
    southwest = json['southwest'] != null
        ? Southwest.fromJson(json['southwest'])
        : null;
  }

  Northeast? northeast;
  Southwest? southwest;

  Viewport copyWith({
    Northeast? northeast,
    Southwest? southwest,
  }) =>
      Viewport(
        northeast: northeast ?? this.northeast,
        southwest: southwest ?? this.southwest,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (northeast != null) {
      map['northeast'] = northeast?.toJson();
    }
    if (southwest != null) {
      map['southwest'] = southwest?.toJson();
    }
    return map;
  }
}

/// lat : 25.0057183197085
/// lng : 121.4738634697085

class Southwest {
  Southwest({
    this.lat,
    this.lng,
  });

  Southwest.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  num? lat;
  num? lng;

  Southwest copyWith({
    num? lat,
    num? lng,
  }) =>
      Southwest(
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

/// lat : 25.0084162802915
/// lng : 121.4765614302915

class Northeast {
  Northeast({
    this.lat,
    this.lng,
  });

  Northeast.fromJson(dynamic json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  num? lat;
  num? lng;

  Northeast copyWith({
    num? lat,
    num? lng,
  }) =>
      Northeast(
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

/// lat : 25.0070544
/// lng : 121.4751039

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
