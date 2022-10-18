import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:godevi/app/core/theme/app_theme.dart';
import 'package:godevi/app/core/theme/color_theme.dart';
import 'package:godevi/app/core/theme/text_theme.dart';
import 'package:godevi/app/modules/home/controllers/dashboard_controller.dart';
import 'package:godevi/app/modules/home/views/home_view.dart';
import 'package:godevi/app/modules/home/views/invoice_view.dart';
import 'package:godevi/app/modules/home/views/profile_view.dart';
import 'package:mixins/mixins.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    int menuLength = 3;

    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () {
          int pageActive = controller.pageActive.value;

          return Scaffold(
            body: Stack(
              children: [
                Stack(
                    children: List<Widget>.generate(menuLength, (int index) {
                  return IgnorePointer(
                    ignoring: index != pageActive,
                    child: Opacity(
                      opacity: pageActive == index ? 1 : 0,
                      child: Navigator(
                        onGenerateRoute: (RouteSettings settings) {
                          List<Widget> pages = [HomeView(), InvoiceView(), ProfileView()];

                          return MaterialPageRoute(
                            builder: (_) => pages[index],
                            settings: settings,
                          );
                        },
                      ),
                    ),
                  );
                })),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: Get.width,
                    height: 90,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 65,
                              child: CustomPaint(
                                size: Size(Get.width, 80),
                                painter: BNBCustomPainter(),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: Get.width,
                              height: 60,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: List.generate(3, (i) {
                                    List<String> labels = ['Beranda', 'Invoice','Akun'];
                                    List<IconData> icons = [FontAwesomeIcons.home, FontAwesomeIcons.file, FontAwesomeIcons.user];

                                    bool isActive = i == pageActive;
                                    Color color = AppThemeColor.active(isActive);

                                    Widget menu = Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(icons[i], color: color),
                                        Textr(labels[i], style: gfont.copyWith(fontSize: 11, color: color), margin: Ei.only(t: 3))
                                      ],
                                    );

                                    return Expanded(
                                      child: i == 1
                                          ? None()
                                          : InkW(
                                              onTap: () => controller.navigate(i),
                                              splash: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              child: menu,
                                            ),
                                    );
                                  })),
                            ),
                          ],
                        ),
                        Positioned.fill(
                            bottom: 27,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Center(
                                child: FloatingActionButton(
                                    backgroundColor: AppThemeColor.background2,
                                    elevation: 0.1,
                                    onPressed: () => controller.navigate(2),
                                    child: Container(
                                        padding: Ei.all(16),
                                        decoration: BoxDecoration(border: Br.all(AppThemeColor.border2), borderRadius: Br.circle),
                                        child: Icon(FontAwesomeIcons.file, size: 22, color: AppThemeColor.active(pageActive == 2)))),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppThemeColor.background2
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.9990000);
    path0.lineTo(size.width * 0.0002875, size.height * 0.0975000);
    path0.quadraticBezierTo(size.width * 0.0071125, size.height * 0.0992000, size.width * 0.4000375, size.height * 0.0054500);
    path0.quadraticBezierTo(size.width * 0.4001750, size.height * 0.7020000, size.width * 0.5007250, size.height * 0.7059500);
    path0.quadraticBezierTo(size.width * 0.6007375, size.height * 0.7005500, size.width * 0.5998000, size.height * 0.0078500);
    path0.quadraticBezierTo(size.width * 0.9936500, size.height * 0.0962500, size.width, size.height * 0.0978000);
    path0.lineTo(size.width, size.height * 0.9997500);
    path0.lineTo(0, size.height * 0.9990000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}