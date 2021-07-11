import 'package:url_launcher/url_launcher.dart';

launchMailto() async {
  try {
    await launch('mailto:sigmacool@gmail.com');
  } catch (e) {
    print(e.toString());
  }
}
