import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jusst_echnologies_task/screens/home_screen.dart';
import 'package:jusst_echnologies_task/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomeScreen(),
            ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.black,
        child:Image.asset(ImagesRes.Logo,width: 300,height: 300,));
  }
}

