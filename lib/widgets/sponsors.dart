import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/screen_helper.dart';

final List<String> sponsorsLogo = [
  "assets/andela-logo.png",
  "assets/ezyagric-logo.png",
  "assets/exuus-logo.png",
  "assets/coa-logo.png",
  "assets/alfatier-logo.png",
  "assets/reconstruction-logo.png",
];

class Sponsors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ResponsiveWrapper(
        minWidth: width,
        maxWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Wrap(
              runSpacing: 50.0,
              spacing: 50.0,
              children: sponsorsLogo
                  .map(
                    (logo) => Container(
                      height: 40.0,
                      child: Image.asset(logo),
                      constraints: BoxConstraints(
                        maxWidth: ScreenHelper.isMobile(context)
                            ? constraints.maxWidth / 3.0 - 50.0
                            : constraints.maxWidth / 5.0 - 50.0,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    ),
  );
}
