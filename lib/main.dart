
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jusst_echnologies_task/provider/Next_screen_provider.dart';
import 'package:jusst_echnologies_task/provider/home_screen_provider.dart';
import 'package:jusst_echnologies_task/screens/home_screen.dart';
import 'package:jusst_echnologies_task/screens/next_screen.dart';
import 'package:jusst_echnologies_task/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomeScreenProvider()),
        ChangeNotifierProvider(create: (context)=>NextScreenProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,

        home: SplashScreen(),
      ),
    );
  }
}