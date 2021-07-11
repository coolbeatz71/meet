import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:meet/models/carousel_item_model.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/launch_email.dart';

import 'dart:html' as html;

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  border: Border.all(width: 1.0, color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    html.window.open(
                      "https://github.com/coolbeatz71",
                      'github',
                    );
                  },
                  splashRadius: 22.0,
                  icon: Icon(
                    FontAwesome.github,
                    color: Colors.white,
                  ),
                  iconSize: 28.0,
                ),
              ),
              SizedBox(width: 18.0),
              Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  border: Border.all(width: 1.0, color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    html.window.open(
                      "https://gitlab.com/coolbeatz71",
                      'gitlab',
                    );
                  },
                  splashRadius: 22.0,
                  icon: Icon(
                    FontAwesome.gitlab,
                    color: Colors.white,
                  ),
                  iconSize: 28.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0),
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
