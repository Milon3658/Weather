import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initial_app/weatherdata.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:get/get.dart';
import 'package:initial_app/Core/Utilities/exportutilities.dart';
import 'Core/Utilities/AppColors.dart';
import 'Core/Utilities/AppConstrains.dart';
import 'package:initial_app/Presentation/locationPage.dart';

import 'package:http/http.dart' as http;

const apiKey = '2354e98370030ff501aec418861005f8';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double latitude;
  double longitude;

  var weatherData;
  double userLocation;
  double temperature;
  double locaionWind;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (weatherData == null) {
      getLocationData();
    }
  }

  getLocationData() async {
    Location location = Location();
    await location.getcurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    //print(latitude);
    //print(longitude);

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    weatherData = await networkHelper.getData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: weatherData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
        height: Get.height,
            constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "asset/images/mainImage.jpg",
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await getLocationData();
                  },
                  child: ListView(
                    children: [
                      Container(
                        height: 30,
                      ),
                      Container(
                        height: 150,
                        width: Get.width,
                        child: FloatingSearchBar(
                          //backgroundColor: Colors.transparent,
                          //accentColor: Colors.transparent,
                          //backdropColor: Colors.transparent,
                          //shadowColor: Colors.transparent,

                          hint: 'Find your Location',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          scrollPadding: const EdgeInsets.only(top: 16),
                          transitionDuration: const Duration(milliseconds: 800),
                          transitionCurve: Curves.easeInOut,
                          physics: const BouncingScrollPhysics(),
//axisAlignment: isPortrait ? 0.0 : -1.0,
                          openAxisAlignment: 0.0,
                          width: 320,
                          debounceDelay: const Duration(milliseconds: 500),
                          onQueryChanged: (query) {
// Call your model, bloc, controller here.
                          },
                          builder: (BuildContext context,
                              Animation<double> transition) {},
                        ),
                      ),
                      AppConstrains.height20,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${weatherData['name']}',
                          style: TextStyle(
                            fontSize: 50,
                            color: AppColours.FONTCOLOR,
                          ),
                        ),
                      ),
                      AppConstrains.height10,
                      Row(
                        children: [
                          Text(
                            "Time and Date",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColours.FONTCOLOR,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "${(weatherData['main']['temp'] - 273).toStringAsFixed(0)}°C",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: AppColours.FONTCOLOR,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.auto_awesome,
                                      color: AppColours.FONTCOLOR, size: 20),
                                  AppConstrains.width15,
                                  Text(
                                    "Night",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColours.FONTCOLOR,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      AppConstrains.height40,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                      ),
                      AppConstrains.height40,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Wind",
                                style: TextStyle(
                                  color: AppColours.FONTCOLOR,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${weatherData['wind']['speed']}",
                                style: TextStyle(
                                  color: AppColours.FONTCOLOR,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "km/h",
                                style: TextStyle(
                                  color: AppColours.FONTCOLOR,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          AppConstrains.width40,
                          AppConstrains.width40,
                          Column(
                            children: [
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  color: AppColours.FONTCOLOR,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${weatherData['main']['humidity']}",
                                style: TextStyle(
                                  color: AppColours.FONTCOLOR,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                  color: AppColours.FONTCOLOR,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      AppConstrains.height40,
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

//
// var userLocation = decodeData['name'];
// var temp= decodeData['main']['temp'];
// print(temp);
// print(userLocation);
