import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
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
}
