import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/helper_function.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  // TODO: Add material page
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HelperFunction _helperFunction = HelperFunction();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      _helperFunction.navigateToPage(context, const LoginScreen());
    });
  }

  // TODO: Add did change dependencies

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('BOOKS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: ContinuousRectangleBorder(
                      side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'images/books.png',
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              const SizedBox(
                height: 100,
              ),
              const Center(
                child: Text('Initializing',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
