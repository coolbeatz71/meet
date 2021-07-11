import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/screen_helper.dart';

class ProjectCarousel extends StatelessWidget {
  final List items;
  final CarouselController carouselController;

  ProjectCarousel({
    Key? key,
    required this.items,
    required this.carouselController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
      height: itemHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                height: itemHeight,
                autoPlayInterval: Duration(seconds: 15),
                scrollPhysics: NeverScrollableScrollPhysics(),
              ),
              items: List.generate(
                items.length,
                (index) => Builder(
                  builder: (BuildContext context) {
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: itemHeight,
                      ),
                      child: items[index],
                    );
                  },
                ),
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
