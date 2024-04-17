//Models from external sources
//resource:https://stackoverflow.com/questions/57726838/getting-random-android-database-sqlite-sqliteblobtoobigexception

class PlateDetailVo {
  PlateDetailVo({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  PlateDetailVo.fromJson(dynamic json) {
    if (json['html_attributions'] != null) {
      htmlAttributions = [];
      json['html_attributions'].forEach((v) {
        htmlAttributions?.add(v);
      });
    }
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  List<String>? htmlAttributions;
  Result? result;
  String? status;

  PlateDetailVo copyWith({
    List<String>? htmlAttributions,
    Result? result,
    String? status,
  }) =>
      PlateDetailVo(
        htmlAttributions: htmlAttributions ?? this.htmlAttributions,
        result: result ?? this.result,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (htmlAttributions != null) {
      map['html_attributions'] = htmlAttributions?.map((v) => v).toList();
    }
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['status'] = status;
    return map;
  }
}

class Result {
  Result({
    this.addressComponents,
    this.adrAddress,
    this.businessStatus,
    this.currentOpeningHours,
    this.editorialSummary,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.reviews,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.vicinity,
    this.website,
    this.wheelchairAccessibleEntrance,
  });

  Result.fromJson(dynamic json) {
    if (json['address_components'] != null) {
      addressComponents = [];
      json['address_components'].forEach((v) {
        addressComponents?.add(AddressComponents.fromJson(v));
      });
    }
    adrAddress = json['adr_address'];
    businessStatus = json['business_status'];
    currentOpeningHours = json['current_opening_hours'] != null
        ? CurrentOpeningHours.fromJson(json['current_opening_hours'])
        : null;
    editorialSummary = json['editorial_summary'] != null
        ? EditorialSummary.fromJson(json['editorial_summary'])
        : null;
    formattedAddress = json['formatted_address'];
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
    rating = json['rating'];
    reference = json['reference'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    types = json['types'] != null ? json['types'].cast<String>() : [];
    url = json['url'];
    userRatingsTotal = json['user_ratings_total'];
    utcOffset = json['utc_offset'];
    vicinity = json['vicinity'];
    website = json['website'];
    wheelchairAccessibleEntrance = json['wheelchair_accessible_entrance'];
  }

  List<AddressComponents>? addressComponents;
  String? adrAddress;
  String? businessStatus;
  CurrentOpeningHours? currentOpeningHours;
  EditorialSummary? editorialSummary;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  List<Photos>? photos;
  String? placeId;
  PlusCode? plusCode;
  num? rating;
  String? reference;
  List<Reviews>? reviews;
  List<String>? types;
  String? url;
  num? userRatingsTotal;
  num? utcOffset;
  String? vicinity;
  String? website;
  bool? wheelchairAccessibleEntrance;

  Result copyWith({
    List<AddressComponents>? addressComponents,
    String? adrAddress,
    String? businessStatus,
    CurrentOpeningHours? currentOpeningHours,
    EditorialSummary? editorialSummary,
    String? formattedAddress,
    Geometry? geometry,
    String? icon,
    String? iconBackgroundColor,
    String? iconMaskBaseUri,
    String? name,
    OpeningHours? openingHours,
    List<Photos>? photos,
    String? placeId,
    PlusCode? plusCode,
    num? rating,
    String? reference,
    List<Reviews>? reviews,
    List<String>? types,
    String? url,
    num? userRatingsTotal,
    num? utcOffset,
    String? vicinity,
    String? website,
    bool? wheelchairAccessibleEntrance,
  }) =>
      Result(
        addressComponents: addressComponents ?? this.addressComponents,
        adrAddress: adrAddress ?? this.adrAddress,
        businessStatus: businessStatus ?? this.businessStatus,
        currentOpeningHours: currentOpeningHours ?? this.currentOpeningHours,
        editorialSummary: editorialSummary ?? this.editorialSummary,
        formattedAddress: formattedAddress ?? this.formattedAddress,
        geometry: geometry ?? this.geometry,
        icon: icon ?? this.icon,
        iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
        iconMaskBaseUri: iconMaskBaseUri ?? this.iconMaskBaseUri,
        name: name ?? this.name,
        openingHours: openingHours ?? this.openingHours,
        photos: photos ?? this.photos,
        placeId: placeId ?? this.placeId,
        plusCode: plusCode ?? this.plusCode,
        rating: rating ?? this.rating,
        reference: reference ?? this.reference,
        reviews: reviews ?? this.reviews,
        types: types ?? this.types,
        url: url ?? this.url,
        userRatingsTotal: userRatingsTotal ?? this.userRatingsTotal,
        utcOffset: utcOffset ?? this.utcOffset,
        vicinity: vicinity ?? this.vicinity,
        website: website ?? this.website,
        wheelchairAccessibleEntrance:
            wheelchairAccessibleEntrance ?? this.wheelchairAccessibleEntrance,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addressComponents != null) {
      map['address_components'] =
          addressComponents?.map((v) => v.toJson()).toList();
    }
    map['adr_address'] = adrAddress;
    map['business_status'] = businessStatus;
    if (currentOpeningHours != null) {
      map['current_opening_hours'] = currentOpeningHours?.toJson();
    }
    if (editorialSummary != null) {
      map['editorial_summary'] = editorialSummary?.toJson();
    }
    map['formatted_address'] = formattedAddress;
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
    map['rating'] = rating;
    map['reference'] = reference;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['types'] = types;
    map['url'] = url;
    map['user_ratings_total'] = userRatingsTotal;
    map['utc_offset'] = utcOffset;
    map['vicinity'] = vicinity;
    map['website'] = website;
    map['wheelchair_accessible_entrance'] = wheelchairAccessibleEntrance;
    return map;
  }
}

/// author_name : "Chia-chen Lehahn"
/// author_url : "https://www.google.com/maps/contrib/100078562590206508820/reviews"
/// language : "en"
/// original_language : "en"
/// profile_photo_url : "https://lh3.googleusercontent.com/a-/ACB-R5T8ZaMNqlGT8R4W9-U5v87EF8Pr-ZzX2IFnXBS8Jw=s128-c0x00000000-cc-rp-mo-ba7"
/// rating : 5
/// relative_time_description : "6 months ago"
/// text : "Great natural park with many shades/trees, a lot of wild lives (monkeys, frogs, insects, lizards etc). There are many information signs explaining the ecosystem of the park. Remember to bring water. Don’t be afraid of the moneys. They are not aggressive at all."
/// time : 1666633693
/// translated : false

class Reviews {
  Reviews({
    this.authorName,
    this.authorUrl,
    this.language,
    this.originalLanguage,
    this.profilePhotoUrl,
    this.rating,
    this.relativeTimeDescription,
    this.text,
    this.time,
    this.translated,
  });

  Reviews.fromJson(dynamic json) {
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    language = json['language'];
    originalLanguage = json['original_language'];
    profilePhotoUrl = json['profile_photo_url'];
    rating = json['rating'];
    relativeTimeDescription = json['relative_time_description'];
    text = json['text'];
    time = json['time'];
    translated = json['translated'];
  }

  String? authorName;
  String? authorUrl;
  String? language;
  String? originalLanguage;
  String? profilePhotoUrl;
  num? rating;
  String? relativeTimeDescription;
  String? text;
  num? time;
  bool? translated;

  Reviews copyWith({
    String? authorName,
    String? authorUrl,
    String? language,
    String? originalLanguage,
    String? profilePhotoUrl,
    num? rating,
    String? relativeTimeDescription,
    String? text,
    num? time,
    bool? translated,
  }) =>
      Reviews(
        authorName: authorName ?? this.authorName,
        authorUrl: authorUrl ?? this.authorUrl,
        language: language ?? this.language,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
        rating: rating ?? this.rating,
        relativeTimeDescription:
            relativeTimeDescription ?? this.relativeTimeDescription,
        text: text ?? this.text,
        time: time ?? this.time,
        translated: translated ?? this.translated,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author_name'] = authorName;
    map['author_url'] = authorUrl;
    map['language'] = language;
    map['original_language'] = originalLanguage;
    map['profile_photo_url'] = profilePhotoUrl;
    map['rating'] = rating;
    map['relative_time_description'] = relativeTimeDescription;
    map['text'] = text;
    map['time'] = time;
    map['translated'] = translated;
    return map;
  }
}

/// compound_code : "9R27+X5 Singapore"
/// global_code : "6PH59R27+X5"

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

/// height : 4000
/// html_attributions : ["<a href=\"https://maps.google.com/maps/contrib/115240875636662687058\">Sherab Tenzin</a>"]
/// photo_reference : "AZose0l8h9Sq3KxgdwAA5By_25stjbWQHP3rFqIUV1ddTOcWyHMEfMK7R_B1o5Ya6b9CfhgzD-P4wd4eV77GDVA4w_MWxpb5TvSuzzTj5Az7TH9rXWg7KbCFReS1cmZ3Mjts71chaulGpydtW_xeAxA1JiE_FWygdj9flenhxSwMCaiBm-FG"
/// width : 6000

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
}

/// open_now : false
/// periods : [{"close":{"day":0,"time":"1900"},"open":{"day":0,"time":"0700"}},{"close":{"day":1,"time":"1900"},"open":{"day":1,"time":"0700"}},{"close":{"day":2,"time":"1900"},"open":{"day":2,"time":"0700"}},{"close":{"day":3,"time":"1900"},"open":{"day":3,"time":"0700"}},{"close":{"day":4,"time":"1900"},"open":{"day":4,"time":"0700"}},{"close":{"day":5,"time":"1900"},"open":{"day":5,"time":"0700"}},{"close":{"day":6,"time":"1900"},"open":{"day":6,"time":"0700"}}]
/// weekday_text : ["Monday: 7:00 AM – 7:00 PM","Tuesday: 7:00 AM – 7:00 PM","Wednesday: 7:00 AM – 7:00 PM","Thursday: 7:00 AM – 7:00 PM","Friday: 7:00 AM – 7:00 PM","Saturday: 7:00 AM – 7:00 PM","Sunday: 7:00 AM – 7:00 PM"]

class OpeningHours {
  OpeningHours({
    this.openNow,
    this.periods,
    this.weekdayText,
  });

  OpeningHours.fromJson(dynamic json) {
    openNow = json['open_now'];
    if (json['periods'] != null) {
      periods = [];
      json['periods'].forEach((v) {
        periods?.add(Periods.fromJson(v));
      });
    }
    weekdayText =
        json['weekday_text'] != null ? json['weekday_text'].cast<String>() : [];
  }

  bool? openNow;
  List<Periods>? periods;
  List<String>? weekdayText;

  OpeningHours copyWith({
    bool? openNow,
    List<Periods>? periods,
    List<String>? weekdayText,
  }) =>
      OpeningHours(
        openNow: openNow ?? this.openNow,
        periods: periods ?? this.periods,
        weekdayText: weekdayText ?? this.weekdayText,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open_now'] = openNow;
    if (periods != null) {
      map['periods'] = periods?.map((v) => v.toJson()).toList();
    }
    map['weekday_text'] = weekdayText;
    return map;
  }
}

/// close : {"day":0,"time":"1900"}
/// open : {"day":0,"time":"0700"}

class Periods {
  Periods({
    this.close,
    this.open,
  });

  Periods.fromJson(dynamic json) {
    close = json['close'] != null ? Close.fromJson(json['close']) : null;
    open = json['open'] != null ? Open.fromJson(json['open']) : null;
  }

  Close? close;
  Open? open;

  Periods copyWith({
    Close? close,
    Open? open,
  }) =>
      Periods(
        close: close ?? this.close,
        open: open ?? this.open,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (close != null) {
      map['close'] = close?.toJson();
    }
    if (open != null) {
      map['open'] = open?.toJson();
    }
    return map;
  }
}

/// day : 0
/// time : "0700"

class Open {
  Open({
    this.day,
    this.time,
  });

  Open.fromJson(dynamic json) {
    day = json['day'];
    time = json['time'];
  }

  num? day;
  String? time;

  Open copyWith({
    num? day,
    String? time,
  }) =>
      Open(
        day: day ?? this.day,
        time: time ?? this.time,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['time'] = time;
    return map;
  }
}

/// day : 0
/// time : "1900"

class Close {
  Close({
    this.day,
    this.time,
  });

  Close.fromJson(dynamic json) {
    day = json['day'];
    time = json['time'];
  }

  num? day;
  String? time;

  Close copyWith({
    num? day,
    String? time,
  }) =>
      Close(
        day: day ?? this.day,
        time: time ?? this.time,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['time'] = time;
    return map;
  }
}

/// location : {"lat":1.3524931,"lng":103.8129319}
/// viewport : {"northeast":{"lat":1.358107549999999,"lng":103.84579555},"southwest":{"lat":1.33564975,"lng":103.80197735}}

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

/// northeast : {"lat":1.358107549999999,"lng":103.84579555}
/// southwest : {"lat":1.33564975,"lng":103.80197735}

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

/// lat : 1.33564975
/// lng : 103.80197735

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

/// lat : 1.358107549999999
/// lng : 103.84579555

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

/// lat : 1.3524931
/// lng : 103.8129319

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

/// language : "en"
/// overview : "Hiking, kayaking & sightings of long-tailed macaques from a suspended bridge over a forest canopy."

class EditorialSummary {
  EditorialSummary({
    this.language,
    this.overview,
  });

  EditorialSummary.fromJson(dynamic json) {
    language = json['language'];
    overview = json['overview'];
  }

  String? language;
  String? overview;

  EditorialSummary copyWith({
    String? language,
    String? overview,
  }) =>
      EditorialSummary(
        language: language ?? this.language,
        overview: overview ?? this.overview,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language'] = language;
    map['overview'] = overview;
    return map;
  }
}

/// open_now : false
/// periods : [{"close":{"date":"2023-05-07","day":0,"time":"1900"},"open":{"date":"2023-05-07","day":0,"time":"0700"}},{"close":{"date":"2023-05-08","day":1,"time":"1900"},"open":{"date":"2023-05-08","day":1,"time":"0700"}},{"close":{"date":"2023-05-09","day":2,"time":"1900"},"open":{"date":"2023-05-09","day":2,"time":"0700"}},{"close":{"date":"2023-05-10","day":3,"time":"1900"},"open":{"date":"2023-05-10","day":3,"time":"0700"}},{"close":{"date":"2023-05-11","day":4,"time":"1900"},"open":{"date":"2023-05-11","day":4,"time":"0700"}},{"close":{"date":"2023-05-12","day":5,"time":"1900"},"open":{"date":"2023-05-12","day":5,"time":"0700"}},{"close":{"date":"2023-05-06","day":6,"time":"1900"},"open":{"date":"2023-05-06","day":6,"time":"0700"}}]
/// weekday_text : ["Monday: 7:00 AM – 7:00 PM","Tuesday: 7:00 AM – 7:00 PM","Wednesday: 7:00 AM – 7:00 PM","Thursday: 7:00 AM – 7:00 PM","Friday: 7:00 AM – 7:00 PM","Saturday: 7:00 AM – 7:00 PM","Sunday: 7:00 AM – 7:00 PM"]

class CurrentOpeningHours {
  CurrentOpeningHours({
    this.openNow,
    this.periods,
    this.weekdayText,
  });

  CurrentOpeningHours.fromJson(dynamic json) {
    openNow = json['open_now'];
    if (json['periods'] != null) {
      periods = [];
      json['periods'].forEach((v) {
        periods?.add(Periods.fromJson(v));
      });
    }
    weekdayText =
        json['weekday_text'] != null ? json['weekday_text'].cast<String>() : [];
  }

  bool? openNow;
  List<Periods>? periods;
  List<String>? weekdayText;

  CurrentOpeningHours copyWith({
    bool? openNow,
    List<Periods>? periods,
    List<String>? weekdayText,
  }) =>
      CurrentOpeningHours(
        openNow: openNow ?? this.openNow,
        periods: periods ?? this.periods,
        weekdayText: weekdayText ?? this.weekdayText,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['open_now'] = openNow;
    if (periods != null) {
      map['periods'] = periods?.map((v) => v.toJson()).toList();
    }
    map['weekday_text'] = weekdayText;
    return map;
  }
}

/// long_name : "Lornie Road"
/// short_name : "Lornie Rd"
/// types : ["route"]

class AddressComponents {
  AddressComponents({
    this.longName,
    this.shortName,
    this.types,
  });

  AddressComponents.fromJson(dynamic json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = json['types'] != null ? json['types'].cast<String>() : [];
  }

  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponents copyWith({
    String? longName,
    String? shortName,
    List<String>? types,
  }) =>
      AddressComponents(
        longName: longName ?? this.longName,
        shortName: shortName ?? this.shortName,
        types: types ?? this.types,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long_name'] = longName;
    map['short_name'] = shortName;
    map['types'] = types;
    return map;
  }
}
