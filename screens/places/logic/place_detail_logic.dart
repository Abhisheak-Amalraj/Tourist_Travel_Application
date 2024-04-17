import 'package:flutter/widgets.dart';
import 'package:yttravel/screens/places/model/placeVo.dart';
import 'package:yttravel/screens/places/model/place_detail_Vo.dart';
import 'package:yttravel/screens/places/utils/http_util.dart';

import '../model/locationVo.dart';

class PlateDetailLogic extends ChangeNotifier {
  ValueNotifier<PlateDetailVo?> plateDetailVo = ValueNotifier(null);

  void getPlateDetail(String plateId) async {
    plateDetailVo.value = await HttpUtil.instance.getPlateDetail(plateId);
    notifyListeners();
  }
}
