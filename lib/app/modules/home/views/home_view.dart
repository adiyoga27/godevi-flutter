import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:godevi/app/core/theme/app_theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BottomBarType bottomBarType = BottomBarType.Home;

    return SizedBox(
      child: Scaffold(
        backgroundColor: AppTheme.getTheme().backgroundColor,
        bottomNavigationBar: SizedBox(
            height: 58 + MediaQuery.of(context).padding.bottom,
            child: getBottomBarUI(bottomBarType)),
        body: controller.indexView,
      ),
    );
  }

  Widget getBottomBarUI(BottomBarType tabType) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.getTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppTheme.getTheme().dividerColor,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                        AppTheme.getTheme().primaryColor.withOpacity(0.2),
                    onTap: () {
                      controller.tabClick(BottomBarType.Home);
                    },
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: Icon(
                            Icons.search,
                            size: 26,
                            color: tabType == BottomBarType.Home
                                ? AppTheme.getTheme().primaryColor
                                : AppTheme.getTheme().disabledColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Explore",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: tabType == BottomBarType.Home
                                    ? AppTheme.getTheme().primaryColor
                                    : AppTheme.getTheme().disabledColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                        AppTheme.getTheme().primaryColor.withOpacity(0.2),
                    onTap: () {
                      controller.tabClick(BottomBarType.Reservasi);
                    },
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: Icon(
                            FontAwesomeIcons.heart,
                            color: tabType == BottomBarType.Reservasi
                                ? AppTheme.getTheme().primaryColor
                                : AppTheme.getTheme().disabledColor,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Trips",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: tabType == BottomBarType.Reservasi
                                    ? AppTheme.getTheme().primaryColor
                                    : AppTheme.getTheme().disabledColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                        AppTheme.getTheme().primaryColor.withOpacity(0.2),
                    onTap: () {
                      controller.tabClick(BottomBarType.Profile);
                    },
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 40,
                          height: 32,
                          child: Icon(
                            FontAwesomeIcons.user,
                            color: tabType == BottomBarType.Profile
                                ? AppTheme.getTheme().primaryColor
                                : AppTheme.getTheme().disabledColor,
                            size: 22,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: tabType == BottomBarType.Profile
                                    ? AppTheme.getTheme().primaryColor
                                    : AppTheme.getTheme().disabledColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).padding.bottom,
          // )
        ],
      ),
    );
  }
}
