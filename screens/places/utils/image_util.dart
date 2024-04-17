import 'key_util.dart';

class ImageUtil {
  ImageUtil._();

  static final ImageUtil _instance = ImageUtil._();

  static ImageUtil get instance => _instance;

  static String fullImage(String photoReference, {int maxWidth = 400}) {
    var t =
        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=$maxWidth&photoreference=$photoReference&key=${KeyUtil.GOOGLE_MAP_API_KEY_WEB}";
    return t;
  }
}
