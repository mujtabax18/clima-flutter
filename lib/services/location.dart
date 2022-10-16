import 'package:geolocator/geolocator.dart';

class Location{
  double? longitude;
  double? latitiude;
  Future getCurrentLocation() async
  {
    try{
      // if(Geolocator.checkPermission()== Geolocator.checkPermission)
      LocationPermission permission = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude=position.longitude;
      latitiude=position.latitude;
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}
