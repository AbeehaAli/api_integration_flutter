import 'package:flutter/material.dart';
import 'package:flutter_api_integration/screens/details_screen.dart';
import 'package:flutter_api_integration/screens/home_screen.dart';
import 'package:flutter_api_integration/screens/login_screen.dart';
import 'package:flutter_api_integration/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: LoginScreen(),
      home: SplashScreen(),
      // home: HomeScreen(),
      
    );
  }
}

