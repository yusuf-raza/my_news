import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/views/home_screen_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
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
                "images/splash_icon.png",
                fit: BoxFit.cover,
              ),
            )),
            SizedBox(
              width: width,
              child: Center(
                child: Text(
                  "Top Headlines",
                  style: GoogleFonts.aboreto(
                      letterSpacing: .6, color: Colors.blue, fontSize: 24),
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: const SpinKitThreeInOut(
                color: Colors.blue,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreenView()));
    });
  }
}
