import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meet/pages/home/components/carousel.dart';
import 'package:meet/pages/home/components/cv_section.dart';
import 'package:meet/pages/home/components/education_section.dart';
import 'package:meet/pages/home/components/header.dart';
import 'package:meet/pages/home/components/skill_section.dart';
import 'package:meet/pages/home/components/sponsors.dart';
import 'package:meet/pages/home/components/project.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/utils/globals.dart';

import 'components/project_carousel.dart';

class Home extends StatelessWidget {
  final CarouselController carouselCtrl = CarouselController();

  @override
  Widget build(BuildContext context) {
    List projects = [
      Project(
        type: "Web application",
        name: "SAVEPLUS",
        url: "https://saveplus.io",
        image: "assets/saveplus.png",
        desc:
            "a for-profit crowdfunding web application that allows people to raise money for events ranging from life events such as celebrations and graduations to challenging circumstances like accidents and illnesses.",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Flutter Application",
        name: "TASK MANAGER",
        url: "https://github.com/coolbeatz71/task_manager_flutter",
        image: "assets/taskmanager.png",
        desc:
            "A fancy task manager application for learning Dart, Flutter, Bloc pattern and Firebase for flutter",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Flutter Application",
        name: "FILM FAN",
        url: "https://github.com/coolbeatz71/task_manager_flutter",
        image: "assets/filmfan.png",
        desc:
            "A Simple mobile app to learn advanced flutter notions. It is connected to themoviedb Rest API to fetch not playing movies, movie details, rate movies, movie casting, recommended and similar movies.",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Admin dashboard",
        name: "EZYAGRIC",
        url: "https://ezyagric.com",
        image: "assets/ezyagric.png",
        desc:
            "An on-demand web and mobile platform that provides inclusive and data-driven access to production, marketing and finance services to farmers and agribusinesses in Uganda. Through EzyAgric farmers map their gardens to attain accurate, genuine inputs and services, farm records, finance and markets that pay for quality.",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Internal Slack App",
        name: "TEMBEA",
        url: "",
        image: "assets/nopreview.png",
        desc:
            "An internal platform through which Andela automates all processes with regards to trip, routes management and reconciliation, using a Slack application. It solves the needs of Andela’s Operations Department and Partner-placed Fellows, it provides the Travel Team with tools to aid trip management and data collection for visiting Andelans to other institutions",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Vscode theme",
        name: "COOLEST DARK",
        url:
            "https://marketplace.visualstudio.com/items?itemName=mutomboJeanVincent.coolest-dark",
        image: "assets/coolestdark.png",
        desc:
            "A visual studio code dark theme for Dart and Flutter based on One Dark Pro and Bear Theme",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Npm Package",
        name: "REACT-EXCEL-GRID-EXPORT",
        url: "https://www.npmjs.com/package/react-excel-grid-export",
        image: "assets/nopreview.png",
        desc:
            "A open-source npm package to export dataset from react to different formats.",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Web application",
        name: "RECONSTRUCTION",
        url: "https://reconstruction.us/",
        image: "assets/reconstruction.png",
        desc:
            "A black culture educational web app created to show black kids that they are descendants of powerful, creative, and resilient ancestors whose contributions permeate every aspect of life across the globe; and that they too are called to contribute to this rich legacy. It's the way we were taught as children. It's the way we teach our children.",
        carouselController: carouselCtrl,
      ),
      Project(
        type: "Web application",
        name: "AlFATIER",
        url: "https://app.alfatier.io/",
        image: "assets/alfatier.png",
        desc:
            "A Web application that focuses on professional networking and career development. You can use Alfatier to share your skills, search and join companies called <<Tribes>>, and enhance your professional reputation by posting updates and interacting with other people",
        carouselController: carouselCtrl,
      ),
    ];

    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(),
              ),
              Carousel(),
              SizedBox(height: 20.0),
              CvSection(),
              SizedBox(height: 70.0),
              ProjectCarousel(
                items: projects,
                carouselController: carouselCtrl,
              ),
              SizedBox(height: 50.0),
              EducationSection(),
              SizedBox(height: 50.0),
              SkillSection(),
              SizedBox(height: 50.0),
              Sponsors(),
            ],
          ),
        ),
      ),
    );
  }
}
