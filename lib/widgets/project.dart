import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'dart:html' as html;

import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/screen_helper.dart';

class Project extends StatelessWidget {
  final String url;
  final String type;
  final String name;
  final String desc;
  final String image;
  final CarouselController carouselController;

  Project({
    Key? key,
    required this.type,
    required this.name,
    required this.desc,
    required this.url,
    required this.image,
    required this.carouselController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "CONTRIBUTIONS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  child: Flex(
                    direction: constraints.maxWidth > 720
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      Expanded(
                        flex: constraints.maxWidth > 720.0 ? 1 : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.type,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              this.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                                fontSize: 35.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              this.desc,
                              style: TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Row(
                              children: [
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
                                      onPressed: () {
                                        html.window.open(this.url, 'url');
                                      },
                                      child: Center(
                                        child: Text(
                                          "VISIT",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    height: 48.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 28.0),
                                    child: TextButton(
                                      onPressed: () {
                                        carouselController.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.linear,
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          "NEXT APP",
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 70.0)
                          ],
                        ),
                      ),
                      ResponsiveVisibility(
                        visible: false,
                        visibleWhen: [
                          Condition.largerThan(breakpoint: 800),
                        ],
                        child: SizedBox(width: 25.0),
                      ),
                      ResponsiveVisibility(
                        visible: false,
                        visibleWhen: [
                          Condition.largerThan(breakpoint: 800),
                        ],
                        child: Expanded(
                          flex: constraints.maxWidth > 720.0 ? 1 : 0,
                          child: Image.asset(
                            this.image,
                            width: constraints.maxWidth > 720.0 ? null : 350.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
