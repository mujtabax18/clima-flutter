import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/services/location.dart';


class WeatherModel {
  Location location=Location();
  String _kweatherkey="7a9e6ca1c5b3ee74ddf70ab4c655ea7f";
  final  String openWeatheURl='https://api.openweathermap.org/data/2.5/weather';

 // https://api.openweathermap.org/data/2.5/weather?q={city id}&appid={API key}

  Future getCityData(String cityName) async{
    NetworkingHelper networkingHelper = NetworkingHelper( '$openWeatheURl?q=$cityName&appid=$_kweatherkey');
    var weatherData=await networkingHelper.getData();
    print(weatherData);
    return weatherData;
  }


  Future getLocationData()async
  {
    await location.getCurrentLocation();
    NetworkingHelper networkingHelper = NetworkingHelper( '$openWeatheURl?lat=${location.latitiude}&lon=${location.longitude}&appid=$_kweatherkey');
    var weatherData=await networkingHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
