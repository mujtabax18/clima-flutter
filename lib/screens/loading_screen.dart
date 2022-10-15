import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  location locations=location();
  double? lati;
  double? logi;
  String kweatherkey="7a9e6ca1c5b3ee74ddf70ab4c655ea7f";
  void initState(){
   super.initState();
   getlocation();

   
 }
void getlocation()async{
  LocationPermission permission = await Geolocator.requestPermission();
  await locations.getCurrentLocation();
  //lati=locations.latitiude;
  //logi=locations.longitude;
  lati=30.0561;
  logi=70.6348;
  print(logi);
  print(lati);

}
 Future<void> getwetherdata()async{
   http.Response response= await http.get(Uri.parse( 'https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$logi&appid=$kweatherkey'));
   if(response.statusCode==200) {
     String data=response.body;
      var jasondata=jsonDecode(data);
      String Cityname=jasondata['name'];
      double temp=jasondata['main']['temp'];
      int condi=jasondata['weather'][0]['id'];

    }
   print('dsfas'+ response.statusCode.toString());

 }

  @override
  Widget build(BuildContext context) {
    getlocation();
    getwetherdata();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getwetherdata();

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
