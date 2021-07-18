import 'package:flutter/material.dart';
import 'package:meet/utils/constants.dart';
import 'package:meet/widgets/header.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.scrollController,
    required this.anchors,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<double> anchors;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      child: MaterialButton(
                        color: kPrimaryColor,
                        hoverColor: kPrimaryHoverColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        onPressed: () {
                          scrollController.animateTo(
                            anchors[index],
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : ListTile(
                      title: InkWell(
                        onTap: () {
                          scrollController.animateTo(
                            anchors[index],
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
    );
  }
}
