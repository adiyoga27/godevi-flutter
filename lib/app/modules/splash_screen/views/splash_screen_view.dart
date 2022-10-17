import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:godevi/app/core/theme/app_theme.dart';
import 'package:godevi/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: !AppTheme.isLightTheme
                ? BoxDecoration(
                    color: AppTheme.getTheme().backgroundColor.withOpacity(0.4))
                : null,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/introduction.jpg',
                fit: BoxFit.cover),
          ),
          Column(
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.getTheme().dividerColor,
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Image.asset('assets/images/appIcon.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Motel",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Best hotel deals for your holiday",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 48, right: 48, bottom: 8, top: 8),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.getTheme().primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppTheme.getTheme().dividerColor,
                        blurRadius: 8,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.toNamed(Routes.INTRODUCTION);
                      },
                      child: const Center(
                        child: Text(
                          "Get started",
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
              Padding(
                padding: EdgeInsets.only(
                    bottom: 24.0 + MediaQuery.of(context).padding.bottom,
                    top: 16),
                child: const Text(
                  "Already have account? Log in",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
