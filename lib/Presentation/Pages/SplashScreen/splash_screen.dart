import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:initial_app/main_page.dart';
import 'package:get/get.dart';

import '../../../Core/Utilities/AppRoutes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    nextscreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children:[
            Expanded(
              child: Center(
                child: SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 60.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void nextscreen()async{
   await Future.delayed(Duration(milliseconds: 2100));
   Get.offAndToNamed(AppRoutes.MAINPAGE);
  }
}

