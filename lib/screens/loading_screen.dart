import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
@override
  void initState(){
   super.initState();
   getlocaData();
 }
void getlocaData()async{
  var weatherData= await WeatherModel().getLocationData();
  gotolocationscreen(weatherData);

}
void gotolocationscreen(dynamic weatherData)
{
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherData);
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
