import 'package:url_launcher/url_launcher.dart';

class Launcher {
  static Future<void> launchURL(String url) async
  {
    Uri uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
    else {
      await launchUrl(uri);

    }
  }
}