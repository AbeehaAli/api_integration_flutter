import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_api_integration/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    print('navigation');

    Timer(
      const Duration(seconds: 3), 
      () {
    
        Navigator.pushReplacement(
          context,
           MaterialPageRoute(builder: (_) => const LoginScreen(),
           )
        );
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     body: Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/images/app_logo.jpeg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10,),


         RichText(
  text: const TextSpan(
    children: [
      TextSpan(
        text: "BookVerse ",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 34,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
      TextSpan(
        text: "AI",
        style: TextStyle(
          color: Color(0xff7C3AED),
          fontSize: 34,
          fontWeight: FontWeight.w800,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 10),

Text(
  "Discover. Read. Grow.",
  style: TextStyle(
    fontSize: 18,
    color: Colors.grey.shade600,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  ),
),

const SizedBox(height: 100),

const Icon(
  Icons.menu_book_rounded,
  color: Color(0xff9F7AEA),
  size: 28,
),

const SizedBox(height: 12),

const Text(
  "Loading your library...",
  style: TextStyle(
    color: Color(0xff7C3AED),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  ),
),

const SizedBox(height: 18),

SizedBox(
  width: 150,
  child: const LinearProgressIndicator(
    minHeight: 4,
    valueColor: AlwaysStoppedAnimation(Color(0xFF7C3AED)),
    backgroundColor: Color(0xFFE9DDFC),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
),

const SizedBox(height: 40),
        ],
      ),
     ),
    );
  }
}