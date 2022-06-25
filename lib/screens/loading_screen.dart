import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';






class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // double latitude;
  // double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
//    getData();
  }

  void getLocationData() async {

    WeatherModel weathermodels = WeatherModel();
    var weatherData= await weathermodels.getLocationWeather();

    // Location location = Location();
    // await location.getCurrentLocation();
    // // latitude=location.latitude;
    // // longitude=location.longitude;
    // NetworlHelper networkhelper= NetworlHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    // var weatherData = await networkhelper.getData();
  
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    },),);


      // var longitude = jsonDecode(data)['coord']['lon'];

      // print(longitude);


    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.amber,
          size: 100.0,
          ),
      ),
    );
  }
}

