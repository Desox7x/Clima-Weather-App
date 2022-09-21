import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '485bcaef03a04d0ec04ae57f0d46b17e';
const weatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

   Future<dynamic> getCityWeather(String cityName) async {

    var url = '$weatherURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

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

  String getMessage(int condition) {
    if (condition < 300) {
      return 'Tormenta eléctrica';
    } else if (condition < 400) {
      return 'Llovizna';
    } else if (condition < 600) {
      return 'Lluvia';
    } else if (condition < 700) {
      return 'Nieve';
    } else if (condition == 701) {
      return 'Niebla';
    } else if (condition == 711){
      return 'Humo';
    } else if (condition == 731){
      return 'Polvo';
    } else if (condition == 781){
      return 'Tornado';
    } else if (condition == 800) {
      return 'Despejado';
    } else if (condition <= 802) {
      return 'Parcialmente nublado';
    } else if (condition <= 804) {
      return 'Nublado';
    } else {
      return 'Sin datos‍';
    }
  }
}
