import 'package:geolocator/geolocator.dart';

class Location{
  double? longitude;
  double? latitiude;
  Future getCurrentLocation() async
  {
    try{
       LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      longitude=position.longitude;
      latitiude=position.latitude;
      print('done');
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}
