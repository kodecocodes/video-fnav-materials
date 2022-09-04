import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/helper_function.dart';

import '../router/app_state_manager.dart';
import '../router/book_pages.dart';

class SplashScreen extends StatefulWidget {
    static MaterialPage page() {
    return MaterialPage(
      name: BookPages.splashPath,
      key: ValueKey(BookPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HelperFunction _helperFunction = HelperFunction();

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initislizeApp();
  }
  

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
