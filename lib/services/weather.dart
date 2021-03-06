import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apikey ='b17f53e9ba4f1b49043f5e4a6a74d346';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {


  Future<dynamic> getCityWeather( String cityName) async{
    var url ='$openWeatherMap?q=$cityName&appid=$apikey&units=metric';
    NetworlHelper networlHelper=NetworlHelper(url);

    var weatherData=await networlHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
       Location location = Location();
    await location.getCurrentLocation();

    // latitude=location.latitude;
    // longitude=location.longitude;
    
    NetworlHelper networkhelper= NetworlHelper('$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkhelper.getData();
    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
