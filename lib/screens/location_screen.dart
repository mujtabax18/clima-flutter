import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/screens/city_screen.dart';
class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({@required this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel=WeatherModel();

  String Cityname='noon';
  int temperature=20;
  String msg='its null nothing found';
  String weatherIcon='☀️';
@override
 void initState(){
   super.initState();
   updateUI(widget.locationWeather);
 }

 void updateUI(dynamic weatherData){
   setState(() {
     if(weatherData==null){
       Cityname='';
       temperature=0;
       msg='Unable to get Location';
       return;
     }
       Cityname=weatherData['name'];
        double temp = weatherData['main']['temp'];
        temperature = (temp - 273.15).toInt();
        int condi = (weatherData['weather'][0]['id']);
        weatherIcon = weatherModel.getWeatherIcon(condi);
        msg = weatherModel.getMessage(temperature);

    });

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherData = await weatherModel.getLocationData();
                        updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                   var cityName= await   Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                   if(Cityname!=null) {
                   var weatherData=  await weatherModel.getCityData(cityName);
                      updateUI(weatherData);
                   }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$msg $Cityname!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
