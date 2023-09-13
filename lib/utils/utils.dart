import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/components/home_screen_headline_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Widget customSpinKitSmall() {
    return const SpinKitWaveSpinner(
      waveColor: Colors.green,
      trackColor: Colors.blue,
      color: Colors.orange,
      size: 25,
    );
  }
  Widget customSpinKitMedium() {
    return const SpinKitWaveSpinner(
      waveColor: Colors.green,
      trackColor: Colors.blue,
      color: Colors.orange,
      size: 35,
    );
  }
  Widget customSpinKitLarge() {
    return const SpinKitWaveSpinner(
      waveColor: Colors.green,
      trackColor: Colors.blue,
      color: Colors.orange,
      size: 50,
    );
  }

  Widget customSpinKitSplashScreen(){
    return const SpinKitThreeInOut(
      color: Colors.blue,
      size: 25,
    );
  }

  Widget customShimmer(double width, double height){
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blue.shade100,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: HomeScreenHeadlineCard(
            imageUrl: '', // Empty URL for shimmer effect
            width: width,
            height: height,
            title: '',
            source: '',
            publishedAt: DateTime.now().toString(),
            url: '',
            author: '',
            content: '',
          ),
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    // Parse the input string into a DateTime object
    DateTime date = DateTime.parse(dateString);

    // Define the desired date format
    final DateFormat formatter = DateFormat('MMM d');

    // Format the parsed date using the formatter
    return formatter.format(date);
  }

  Future<void> launchURL(String url) async {
    if (!await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }
}
