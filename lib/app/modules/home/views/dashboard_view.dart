import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:godevi/app/core/theme/app_theme.dart';
import 'package:godevi/app/modules/dashboard/views/slider_view.dart';
import 'package:godevi/app/modules/dashboard/views/title_view.dart';
import 'package:godevi/app/modules/home/controllers/home_controller.dart';

class HomeExploreScreen extends GetView<HomeController> {
  const HomeExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: controller.animationController,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 40 * (1.0 - controller.animationController.value), 0.0),
            child: Scaffold(
              backgroundColor: AppTheme.getTheme().backgroundColor,
              body: Stack(
                children: <Widget>[
                  NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: ContestTabHeader(
                              (MediaQuery.of(context).size.width * 1.3)),
                        ),
                      ];
                    },
                    body: Container(
                      color: AppTheme.getTheme().backgroundColor,
                      child: ListView.builder(
                        itemCount: 4,
                        padding: const EdgeInsets.only(top: 32, bottom: 16),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var count = 4;
                          var animation = Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: controller.animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn),
                            ),
                          );
                          if (index == 0) {
                            return TitleView(
                              titleTxt: 'Popular Destinations',
                              subTxt: '',
                              animation: animation,
                              animationController:
                                  controller.animationController,
                              click: () {},
                            );
                          } else if (index == 1) {
                            return TitleView(
                              titleTxt: 'Popular Destinations',
                              subTxt: '',
                              animation: animation,
                              animationController:
                                  controller.animationController,
                              click: () {},
                            );
                          } else if (index == 2) {
                            return TitleView(
                              titleTxt: 'Popular Destinations',
                              subTxt: '',
                              animation: animation,
                              animationController:
                                  controller.animationController,
                              click: () {},
                            );
                          } else {
                            return getDealListView(index);
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          AppTheme.getTheme().backgroundColor.withOpacity(0.4),
                          AppTheme.getTheme().backgroundColor.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 0,
                    right: 0,
                    child: serachUI(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getDealListView(int index) {
    var hotelList = controller.hotelList;
    List<Widget> list = <Widget>[];
    hotelList.forEach((f) {
      var animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller.animationController,
          curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn),
        ),
      );
      // list.add(
      //   HotelListView(
      //     callback: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => HotelDetailes(
      //                   hotelData: f,
      //                 ),
      //             fullscreenDialog: true),
      //       );
      //     },
      //     hotelData: f,
      //     animation: animation,
      //     animationController: widget.animationController,
      //   ),
      // );
    });
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: list,
      ),
    );
  }

  Widget serachUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.getTheme().backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(38)),
          // border: Border.all(
          //   color: HexColor("#757575").withOpacity(0.6),
          // ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppTheme.getTheme().dividerColor,
              blurRadius: 8,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 48,
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(38)),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => SearchScreen(),
                  //       fullscreenDialog: true),
                  // );
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.search,
                      size: 18,
                      color: AppTheme.getTheme().primaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => SearchScreen(), fullscreenDialog: true),
                        //   );
                        // },
                        enabled: false,
                        onChanged: (String txt) {},
                        style: const TextStyle(
                          fontSize: 16,
                          // color: AppTheme.dark_grey,
                        ),
                        cursorColor: AppTheme.getTheme().primaryColor,
                        decoration: InputDecoration(
                          errorText: null,
                          border: InputBorder.none,
                          hintText: "Where are you going?",
                          hintStyle: TextStyle(
                              color: AppTheme.getTheme().disabledColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  final double heightValue;

  ContestTabHeader(
    this.heightValue,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var minValue = (shrinkOffset < heightValue - heightValue / 3
        ? shrinkOffset
        : heightValue / 3);
    return SizedBox(
      height: heightValue - minValue,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: SliderView(
          //     child: (
          //       opValue: getOpValue(minValue, heightValue / 3),
          //       click: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => HotelHomeScreen()),
          //         );
          //       },
          //     ),
          //     height: heightValue, opValue: null,
          //   ),
          // )
        ],
      ),
    );
  }

  double getOpValue(double minValue, double maxValue) {
    var data = (1.0 - (minValue / maxValue));
    if (data < 0.0) {
      return 0.0;
    } else if (data >= 0 && data <= 1) {
      return data;
    } else {
      return 1.0;
    }
  }

  @override
  double get maxExtent => heightValue;

  @override
  double get minExtent => heightValue / 3;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
