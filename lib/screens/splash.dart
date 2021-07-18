import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:meet/screens/home.dart';
import 'package:meet/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 90.0,
      splash: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "MJV",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ".",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      nextScreen: Container(
        child: Home(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: kBackgroundColor.withOpacity(0.8),
      animationDuration: Duration(milliseconds: 500),
      duration: 1000,
    );
  }
}
