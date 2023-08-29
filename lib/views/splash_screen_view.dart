import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/routes.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/views/home_screen_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'homeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();

    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
              height: height * .5,
              child: Image.asset(
                "images/splash_icon.gif",
                fit: BoxFit.cover,
              ),
            )),
            SizedBox(
              width: width,
              child: Center(
                child: Text(
                  "My News App",
                  style: GoogleFonts.acme(
                      letterSpacing: .6, color: Colors.blue, fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: utils.customSpinKitSplashScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
