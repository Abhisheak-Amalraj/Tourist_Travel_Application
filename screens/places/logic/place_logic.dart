import 'package:flutter/widgets.dart';
import 'package:yttravel/screens/places/model/placeVo.dart';
import 'package:yttravel/screens/places/utils/http_util.dart';

import '../model/distanceVo.dart';
import '../model/locationVo.dart';

class PlateLogic extends ChangeNotifier {
  LocationVo? _locationVo;

  LocationVo? get locationVo => _locationVo;

  ValueNotifier<List<Results>?> park = ValueNotifier(null);
  ValueNotifier<List<Results>?> museum = ValueNotifier(null);
  ValueNotifier<List<Results>?> library = ValueNotifier(null);
  ValueNotifier<List<Results>?> buildings = ValueNotifier(null);
  ValueNotifier<DistanceVo?> distance = ValueNotifier(null);
  List<DistanceVo> distanceList = [];

  void init() {
    initLocation();
  }

  void initLocation() async {
    _locationVo = await HttpUtil.instance.getLocation();
    if (_locationVo != null) {
      getPark();
      getMuseum();
      getLibrary();
      getBuildings();
    }
  }

  void getPark() async {
    var plateVo = await fetch('park');
    park.value = List.from(plateVo.results ?? []);
    notifyListeners();
  }

  void getMuseum() async {
    var plateVo = await fetch('museum');
    museum.value = List.from(plateVo.results ?? []);
    notifyListeners();
  }

  void getLibrary() async {
    var plateVo = await fetch('library');
    library.value = List.from(plateVo.results ?? []);
    notifyListeners();
  }

  void getBuildings() async {
    // var plateVo = await fetch('tourist_attraction');
    var plateVo = await fetch('historical_places&keyword=landmarks,');
    buildings.value = List.from(plateVo.results ?? []);
    notifyListeners();
  }

  Future<PlateVo> fetch(String type) {
    return HttpUtil.instance
        .getPlate(_locationVo?.location?.lat, _locationVo?.location?.lng, type);
        // Get location information
  }

  Future getDistance(num? lat, num? lng, String? plateId) async {
    var result = await HttpUtil.instance.getDistance(_locationVo?.location?.lat,
        _locationVo?.location?.lng, lat, lng, plateId);
    for (var item in distanceList) {
      if (item.plateId == plateId && item.plateId != null) {
        distanceList.remove(item);
      }
      distanceList.add(result);
    }
    distance.value = result;
  }
}
