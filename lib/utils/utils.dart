import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
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
