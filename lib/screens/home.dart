import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meet/data/project.dart';
import 'package:meet/utils/screen_helper.dart';
import 'package:meet/widgets/drawer.dart';
import 'package:meet/widgets/project_carousel.dart';
import 'package:meet/widgets/box_offset.dart';
import 'package:meet/widgets/carousel.dart';
import 'package:meet/widgets/cv_section.dart';
import 'package:meet/widgets/experience_section.dart';
import 'package:meet/widgets/footer.dart';
import 'package:meet/widgets/header.dart';
import 'package:meet/widgets/skill_section.dart';
import 'package:meet/widgets/sponsors.dart';
import 'package:meet/utils/globals.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselController carouselCtrl = CarouselController();

  List<double> anchors = [];
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();

    anchors = List.generate(6, (index) => index.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List projects = projectList(carouselCtrl);

    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: AppDrawer(
        scrollController: scrollController,
        anchors: anchors,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              margin: EdgeInsets.only(top: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Carousel(),
                  SizedBox(height: 20.0),
                  BoxOffset(
                    getOffset: (offset) {
                      if (ScreenHelper.isMobile(context)) {
                        anchors[1] = offset.dy;
                      } else {
                        anchors[1] = offset.dy - 150;
                      }
                    },
                    child: CvSection(),
                  ),
                  SizedBox(height: 70.0),
                  BoxOffset(
                    getOffset: (offset) {
                      if (ScreenHelper.isMobile(context)) {
                        anchors[2] = offset.dy + 600;
                      } else {
                        anchors[2] = offset.dy + 300;
                      }
                    },
                    child: ProjectCarousel(
                      items: projects,
                      carouselController: carouselCtrl,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  BoxOffset(
                    getOffset: (offset) {
                      if (ScreenHelper.isMobile(context)) {
                        anchors[3] = offset.dy + 680;
                      } else {
                        anchors[3] = offset.dy + 200;
                      }
                    },
                    child: ExperienceSection(),
                  ),
                  SizedBox(height: 50.0),
                  BoxOffset(
                    getOffset: (offset) {
                      if (ScreenHelper.isMobile(context)) {
                        anchors[4] = offset.dy + 1800;
                      } else {
                        anchors[4] = offset.dy + 800;
                      }
                    },
                    child: SkillSection(),
                  ),
                  SizedBox(height: 50.0),
                  Sponsors(),
                  BoxOffset(
                    getOffset: (offset) {
                      if (ScreenHelper.isMobile(context)) {
                        anchors[5] = offset.dy + 2800;
                      } else {
                        anchors[5] = offset.dy + 1800;
                      }
                    },
                    child: Footer(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              elevation: 2.0,
              child: Container(
                child: Header(
                  scrollController: scrollController,
                  anchors: anchors,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
