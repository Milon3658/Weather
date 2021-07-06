import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:get/get.dart';
import 'package:initial_app/Core/Utilities/exportutilities.dart';
import 'Core/Utilities/AppColors.dart';
import 'Core/Utilities/AppConstrains.dart';
import 'Core/Utilities/exportutilities.dart';

//import 'package:location/location.dart';
import 'package:initial_app/Presentation/locationPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double latitude;
  double longitude;
  DateTime timeandDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocaton();
  }

  void getLocaton() async {
    Location location = Location();
    await location.getcurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
          child: Column(
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
                  builder:
                      (BuildContext context, Animation<double> transition) {},
                ),
              ),
              AppConstrains.height20,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "City",
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
              Spacer(),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "28 °C",
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
                        "10",
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
                  Column(
                    children: [
                      Text(
                        "Rain",
                        style: TextStyle(
                          color: AppColours.FONTCOLOR,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "2",
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
                        "10",
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
    );
  }
}
