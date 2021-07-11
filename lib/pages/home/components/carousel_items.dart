import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meet/models/carousel_item_model.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/launch_email.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Full-Stack PEAN, MERN Engineer",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 18.0),
          Text(
            "MUTOMBO\nJean-vincent",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Hello, I am a full-stack software engineer passionate about web development and problem-solving. Graduated from the University of Tourism, Technology and Business Studies with a bachelor's degree in Business Information Technology in 2018, I am motivated to constantly improve my skills and change people’s lives through technology",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 14.0,
              height: 1.8,
            ),
          ),
          SizedBox(height: 25.0),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 48.0,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              child: TextButton(
                onPressed: () async {
                  await launchMailto();
                },
                child: Text(
                  "Got a project? Let's talk.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    image: Container(
      child: Image.asset(
        "assets/me.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);
