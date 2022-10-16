import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location=Location();
  double? lati;
  double? logi;
  String kweatherkey="7a9e6ca1c5b3ee74ddf70ab4c655ea7f";
  void initState(){
   super.initState();
   getlocationData();
 }
void getlocationData()async{

 await location.getCurrentLocation();
  logi=location.longitude;
  lati=location.latitiude;
  NetworkingHelper networkingHelper = NetworkingHelper( 'https://api.openweathermap.org/data/2.5/weather?lat=$lati&lon=$logi&appid=$kweatherkey');
  var weatherData=await networkingHelper.getData();
 Navigator.push(context, MaterialPageRoute(builder: (context){
   return LocationScreen();
 }));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100.0,
          lineWidth: 20.0,
        ),
      ),
    );
  }
}
