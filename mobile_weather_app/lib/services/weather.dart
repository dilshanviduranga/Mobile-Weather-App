
import 'package:flutter/material.dart';
import 'package:mobile_weather_app/services/location.dart';
import 'package:mobile_weather_app/services/networking.dart';

const apiKey = '138168ee0315670be03886bff74f3914';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationData() async{
    Location location =  Location();
    await location.getCurrentLocation();


    NetworkHelper networkHelper = NetworkHelper('$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

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


  AssetImage getBackgroundImage(int condition){
    // if (temp>25){
    //   return AssetImage('images/sunny.jpg');
    // }else if( temp > 20){
    //   return AssetImage('image/sunnyOrRain.jpg');
    // }else if( temp < 10){
    //   return AssetImage('images/littleDrops.jpg');
    // }else if( temp < 10){
    //   return AssetImage('images/rain.jpg');
    // }else {
    //   return AssetImage('images/green-field-with-sunny-day.jpg');
    // }


    if (condition < 300) {
      return AssetImage('images/rain.jpg');
    } else if (condition < 400) {
      return AssetImage('images/rain.jpg');
    } else if (condition < 600) {
      return AssetImage('images/littleDrops.jpg');
    } else if (condition < 700) {
      return AssetImage('images/snow.jpg');
    } else if (condition < 800) {
      return AssetImage('images/sunny.jpg');
    } else if (condition == 800) {
      return AssetImage('images/sunny.jpg');
    } else if (condition <= 804) {
      return AssetImage('images/sunny.jpg');
    } else {
      return AssetImage('images/green-field-with-sunny-day.jpg');
    }

  }
}
