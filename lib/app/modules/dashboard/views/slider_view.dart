import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:get/get.dart';
import 'package:godevi/app/core/theme/app_theme.dart';
import 'package:godevi/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:godevi/app/modules/introduction/views/introduction_view.dart';

class SliderView extends GetView<DashboardController> {
  final double opValue;
  final VoidCallback click;
  const SliderView({Key? key, required this.opValue, required this.click})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView(
          controller: controller.pageController,
          pageSnapping: true,
          onPageChanged: (index) {
            controller.currentShowIndex = index;
          },
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            PagePopup(
              imageData: controller.pageViewModelData[0],
              opValue: opValue,
            ),
            PagePopup(
              imageData: controller.pageViewModelData[1],
              opValue: opValue,
            ),
            PagePopup(
              imageData: controller.pageViewModelData[2],
              opValue: opValue,
            ),
          ],
        ),
        Positioned(
          bottom: 32,
          right: 32,
          child: PageIndicator(
            layout: PageIndicatorLayout.WARM,
            size: 10.0,
            controller: controller.pageController,
            space: 5.0,
            count: 3,
            color: Colors.white,
            activeColor: AppTheme.getTheme().primaryColor,
          ),
        ),
        Positioned(
          bottom: 32,
          left: 24,
          child: Opacity(
            opacity: opValue,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.getTheme().primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppTheme.getTheme().dividerColor,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (opValue != 0) {
                      click();
                    }
                  },
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 8),
                      child: Text(
                        "View Hotels",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PagePopup extends StatelessWidget {
  final PageViewData imageData;
  final double opValue;

  const PagePopup({Key? key, required this.imageData, this.opValue: 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: (MediaQuery.of(context).size.width * 1.3),
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            imageData.assetsImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 80,
          left: 24,
          child: Opacity(
            opacity: opValue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    imageData.titleText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Text(
                    imageData.subText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
