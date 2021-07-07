import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:initial_app/main_page.dart';
import 'package:initial_app/Presentation/locationPage.dart';


class GetFinalData{



}



  double weatherData;
  double userLocation;
  double temperature;
  double locaionWind;


  void GetData() async {


    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodeData = jsonDecode(data);

      var longitude = decodeData['coord']['lon'];
      var latitude = decodeData['coord']['lat'];
      var weatherData = decodeData['weather'][0]['description'];
      var userLocation = decodeData ['name'];
      var temperature = decodeData['main']['temp'];
      var locaionWind = decodeData['wind']['speed'];
    }