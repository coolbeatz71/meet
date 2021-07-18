import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:meet/models/header_item.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/globals.dart';
import 'package:meet/utils/screen_helper.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "Intro",
    index: 0,
  ),
  HeaderItem(title: "Backgrounds", index: 1),
  HeaderItem(title: "Contributions", index: 2),
  HeaderItem(title: "Experiences", index: 3),
  HeaderItem(title: "Skills", index: 4),
  HeaderItem(
    title: "Contacts",
    index: 5,
    isButton: true,
  ),
];

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
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
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  final ScrollController scrollController;
  final List anchors;

  const HeaderRow({
    Key? key,
    required this.scrollController,
    required this.anchors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(breakpoint: 450),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: MaterialButton(
                        color: kPrimaryColor,
                        hoverColor: kPrimaryHoverColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onPressed: () {
                          scrollController.animateTo(
                            anchors[item.index],
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            scrollController.animateTo(
                              anchors[item.index],
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final ScrollController scrollController;
  final List anchors;

  const Header({
    Key? key,
    required this.anchors,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      margin: EdgeInsets.only(bottom: 18.0),
      height: 62.0,
      child: ScreenHelper(
        desktop:
            buildHeader(kDesktopMaxWidth, context, scrollController, anchors),
        mobile: buildMobileHeader(getMobileMaxWidth(context), context),
        tablet:
            buildHeader(kTabletMaxWidth, context, scrollController, anchors),
      ),
    );
  }

  // mobile header
  Widget buildMobileHeader(double width, BuildContext context) {
    return SafeArea(
      child: Center(
        child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderLogo(),
              GestureDetector(
                onTap: () {
                  Globals.scaffoldKey.currentState!.openEndDrawer();
                },
                child: Icon(
                  FlutterIcons.menu_fea,
                  color: Colors.white,
                  size: 28.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(
    double width,
    BuildContext context,
    ScrollController scrollController,
    List anchors,
  ) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderLogo(),
                HeaderRow(scrollController: scrollController, anchors: anchors),
              ],
            );
          },
        ),
      ),
    );
  }
}
