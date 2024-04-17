import 'package:url_launcher/url_launcher.dart';

class MapUtil {
  static void startMap(num? lat, num? lng) async {
// Concatenate the URL string for Google Maps
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    // If Google Maps app is installed, open the application and directly specify the location
    // Otherwise, open Google Maps in the browser and specify the location
    if (await canLaunch('comgooglemaps://')) {
      await launch('comgooglemaps://?center=$lat,$lng');
    } else {
      await launch(googleMapsUrl);
    }
  }
}
