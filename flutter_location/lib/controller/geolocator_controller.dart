import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeolocatorController extends GetxController {
  bool isLoadingFinish = false;
  bool isRequiredPermission = false;
  Position currentLocation;

  Future<Position> getLocation() async {
    print("getLocation start");
    var perm = await Geolocator.checkPermission();
    print("permission checked $perm");
    if (perm == LocationPermission.denied) {
      print("DENIED");
      return null;
    }
    print("LOCATION WAITING");
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .catchError((e) {
      print("[!] Error permission : $e");
    });
  }

  void permissionOK() {
    getLocation().then((pos) {
      print("OK CURRENT LOCATION  : $pos");
      isLoadingFinish = true;
      currentLocation = pos;
      if (pos == null) {
        isRequiredPermission = true;
      } else {
        isRequiredPermission = false;
      }
    });
  }

}
