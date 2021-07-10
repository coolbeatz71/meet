import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

launchMailto() async {
  try {
    final mailtoLink = Mailto(
      to: ['sigmacool@gmail.com'],
      subject: 'Hire Mutombo Jean-vincent',
    );
    await launch('$mailtoLink');
  } catch (e) {
    print(e.toString());
  }
}
