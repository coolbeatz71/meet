import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meet/data/footer.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/screen_helper.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Container(
                  padding: EdgeInsets.only(top: 50.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.white12),
                    ),
                  ),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: footerItems
                        .map(
                          (footerItem) => Container(
                            height: 120.0,
                            width: ScreenHelper.isMobile(context)
                                ? constraints.maxWidth / 2.0 - 20.0
                                : constraints.maxWidth / 4.0 - 20.0,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        footerItem.iconPath,
                                        size: 25.0,
                                        color: kPrimaryColor,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        footerItem.title,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15.0),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.text1}\n",
                                          style: TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${footerItem.text2}\n",
                                          style: TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
