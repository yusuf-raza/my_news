import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});



  @override
  Widget build(BuildContext context) {

  var height = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      height: height,
      child: Image.asset("images/splash_icon.png"),
    );
  }
}
