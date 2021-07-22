import 'package:flutter/material.dart';
import 'package:meet/data/skills.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:meet/models/skill.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/screen_helper.dart';

class SkillSection extends StatelessWidget {
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
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    "assets/person_small.png",
                    width: 300.0,
                  ),
                ),
                SizedBox(width: 50.0),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SKILLS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        child: Text(
                                          skill.skill,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      flex: 100 - skill.percentage,
                                      child: Divider(
                                        color: Colors.white,
                                        thickness: 2.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "${skill.percentage}%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
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
