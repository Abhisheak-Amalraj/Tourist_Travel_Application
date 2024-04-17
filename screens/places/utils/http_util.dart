import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:yttravel/screens/places/model/distanceVo.dart';
import 'package:yttravel/screens/places/model/locationVo.dart';
import 'package:yttravel/screens/places/model/place_detail_Vo.dart';

import '../model/placeVo.dart';
import 'key_util.dart';

class HttpUtil {
  late Dio dio;

  HttpUtil._internal() {
    dio = Dio();
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   // HTTP
    //   client.findProxy = (uri) {
    //     return "PROXY 10.0.2.2:7890";
    //   };
    //   return null;
    // };

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  static final HttpUtil _instance = HttpUtil._internal();

  static HttpUtil get instance => _instance;

  Future<LocationVo> getLocation() async {
    var response = await dio
        .post(
          'https://www.googleapis.com/geolocation/v1/geolocate?key=${KeyUtil.GOOGLE_MAP_API_KEY_LOCATION}',
        )
        .catchError(
            (e, s) => Response(requestOptions: RequestOptions(path: '')));
    return LocationVo.fromJson(response.data);
  }


  Future<PlateVo> getPlate(num? lat, num? lng, String type) async {
    var response = await dio.post(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=1609.34&type=$type&key=${KeyUtil.GOOGLE_MAP_API_KEY_WEB}');
    return PlateVo.fromJson(response.data);
  }

  Future<PlateDetailVo> getPlateDetail(String plateId) async {
    var response = await dio.post(
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$plateId&key=${KeyUtil.GOOGLE_MAP_API_KEY_WEB}');
    return PlateDetailVo.fromJson(response.data);
  }

  Future<DistanceVo> getDistance(
      num? lat, num? lng, num? lat1, num? lng1, String? plateId,
      {String mode = 'walking'}) async {
    var response = await dio.post(
        'https://maps.googleapis.com/maps/api/distancematrix/json?origins=$lat,$lng&destinations=$lat1,$lng1&mode=$mode&key=${KeyUtil.GOOGLE_MAP_API_KEY_LOCATION}');
    var result = DistanceVo.fromJson(response.data);
    result.plateId = plateId;
    return result;
  }
}
