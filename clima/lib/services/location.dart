import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  LocationPermission? permission;

  Future<void> askPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }

  Future<void> getCurrentLocation() async {
    if (permission == null || permission == LocationPermission.denied) {
      await askPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    } catch (e) {
      print(e);
    }
  }
}
