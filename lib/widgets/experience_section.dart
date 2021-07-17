import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meet/data/experience.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:meet/models/experience.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/screen_helper.dart';

import 'dart:html' as html;

class ExperienceSection extends StatelessWidget {
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
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "WORK EXPEPIENCE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(height: 5.0),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 400.0),
                  child: Text(
                    "A full stack all round developer that does all the job he needs to do at all times.",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: experienceList
                        .map(
                          (education) => Container(
                            width: constraints.maxWidth / 2.0 - 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  education.period,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  education.description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: kCaptionColor,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      html.window.open(
                                        "https://${education.linkName}",
                                        'url',
                                      );
                                    },
                                    child: Text(
                                      education.linkName,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.0)
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
