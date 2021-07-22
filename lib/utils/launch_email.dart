import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

openEmail() async {
  try {
    final mailtoLink = Mailto(
      to: ['sigmacool@gmail.com'],
      subject: 'Hire Mutombo Jean-vincent as a ...',
    );
    await launch('$mailtoLink');
  } catch (e) {
    print(e.toString());
  }
}
