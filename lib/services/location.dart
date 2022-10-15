import 'package:geolocator/geolocator.dart';

class location{
  double? longitude=null;
  double? latitiude=null;
  Future<void> getCurrentLocation() async
  {
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude=position.longitude;
      latitiude=position.latitude;
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}
