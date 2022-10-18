
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:godevi/app/core/theme/color_theme.dart';
import 'package:godevi/app/core/theme/text_theme.dart';
import 'package:godevi/app/core/values/app_config.dart';
import 'package:godevi/app/services/storage/storage.dart';
import 'package:mixins/mixins.dart';
import 'package:teledart/model.dart';

class WiVersion extends StatelessWidget {
  final String appUrl;
  final bool requiredToUpdate;
  const WiVersion({Key? key,  required this.appUrl, this.requiredToUpdate = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String store = Platform.isAndroid ? 'Google Play' : 'App Store';

    String message = requiredToUpdate
        ? 'Hi , versi terbaru dari aplikasi ini sudah tersedia di $store. Demi kenyamanan dan keamanan pengguna, Anda diwajibkan untuk melakukan pembaruan aplikasi ini.'
        : 'Hi, versi terbaru dari aplikasi ini sudah tersedia, silahkan melakukan pembaruan pada $store.';

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: Ei.all(15),
        decoration: BoxDecoration(color: AppThemeColor.background1, borderRadius: Br.radius(10)),
        child: Row(
          crossAxisAlignment: Caa.start,
          children: [
            Iconr(
              FontAwesomeIcons.circleInfo,
              margin: Ei.only(r: 15, t: 3),
            ),
            Flexible(
              child: Col(
                children: [
                  Text(
                    message,
                    style: AppThemeColor.secondaryFont,
                  ),
                  Container(
                    margin: Ei.only(t: 15),
                    child: Row(
                      children: [
                        Touch(onTap: () => Mixins.urlToFile(appUrl), child: Textr('Update', padding: Ei.only(t: 15), style: Gfont.boldWith(Colors.yellow))),
                        Touch(
                            onTap: () => Get.back(),
                            child: Textr('Tutup', padding: Ei.only(t: 15), margin: Ei.only(l: 25), style: AppThemeColor.secondaryFont))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WiMaintenanceInfo extends StatelessWidget {
  final String title, message;
  const WiMaintenanceInfo({Key? key, required this.title, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: Ei.all(15),
        decoration: BoxDecoration(color: AppThemeColor.background1, borderRadius: Br.radius(10)),
        child: Row(
          crossAxisAlignment: Caa.start,
          children: [
            Iconr(
              FontAwesomeIcons.circleInfo,
              margin: Ei.only(r: 15, t: 3),
            ),
            Flexible(
              child: Col(
                children: [
                  Text(
                    message,
                    style: AppThemeColor.secondaryFont,
                  ),
                  Container(
                    margin: Ei.only(t: 15),
                    child: Row(
                      children: [
                        Touch(onTap: () => Get.back(result: 'ok'), child: Textr('OK, Saya Mengerti', style: Gfont.boldWith(Colors.yellow))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WiLockApp extends StatelessWidget {
  final String title, message;

  const WiLockApp({Key? key, required this.title, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: Ei.all(15),
        decoration: BoxDecoration(color: AppThemeColor.background1, borderRadius: Br.radius(10)),
        child: Row(
          crossAxisAlignment: Caa.start,
          children: [
            Iconr(
              FontAwesomeIcons.circleInfo,
              margin: Ei.only(r: 15, t: 3),
            ),
            Flexible(
              child: Col(
                children: [
                  Text(
                    message,
                    style: AppThemeColor.secondaryFont,
                  ),
                  Container(
                    margin: Ei.only(t: 15),
                    child: Row(
                      children: [
                        Touch(onTap: () => Get.back(result: 'ok'), child: Textr('OK, Saya Mengerti', style: Gfont.boldWith(Colors.yellow))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppManager {
  static Future<bool> checkUpdate() async {
    bool isMustUpdate = false;

    Map? c = storage.read('app_config');
    Map? app = c?['app'];

    // local version
    String localVersion = AppConfig.version;
    String localBuildDate = AppConfig.buildDate;
    String localBuild = AppConfig.build;

    int local = '$localVersion$localBuildDate$localBuild'.getNumberOnly;

    // remote version
    String remoteVersion = app?['version'] ?? '0';
    String remoteBuildDate = app?['build_date'] ?? '0';
    String remoteBuild = app?['build'] ?? '0';

    int remote = '$remoteVersion$remoteBuildDate$remoteBuild'.getNumberOnly;

    bool isRemoteBigger = remote > local;
    bool requiredToUpdate = app?['required_to_update'] ?? false;

    // User user = await Auth.user();

    // if (isRemoteBigger) {
    //   Map ratings = c?['about']?['ratings'] ?? {};
    //   String appUrl = Platform.isAndroid ? ratings['playstore'] : ratings['appstore'];

    //   WidgetsBinding.instance.addPostFrameCallback((_) async {
    //     Get.bottomSheet(WiVersion(user: user, appUrl: appUrl, requiredToUpdate: requiredToUpdate)).then((_) {
    //       if (requiredToUpdate) {
    //         isMustUpdate = true;
    //         SystemNavigator.pop();
    //       }
    //     });
    //   });
    // }

    return isMustUpdate;
  }

  static checkMaintenance() async {
    Map? c = storage.read('app_config');
    Map? app = c?['app_maintenance'];

    String title = app?['title'] ?? 'Maintenance';
    String message = app?['message'] ?? 'Maintenance in progress';
    bool show = app?['show'] ?? false;

    if (show) {
      String? local = storage.read('maintenance');
      if (local == message) return;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Get.bottomSheet(WiMaintenanceInfo(title: title, message: message)).then((feedback) {
          if (feedback != null) {
            storage.write('maintenance', message);
          }
        });
      });
    }
  }

  static Future<bool> checkAppStatus() async {
    bool isLocked = false;

    Map? c = storage.read('app_config');
    Map? app = c?['app_lock'];

    String title = app?['title'] ?? 'Maintenance';
    String message = app?['message'] ?? 'Maintenance in progress';
    bool lock = app?['lock'] ?? false;

    if (lock) {
      isLocked = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Get.bottomSheet(WiMaintenanceInfo(title: title, message: message)).then((_) {
          SystemNavigator.pop();
        });
      });
    }

    return isLocked;
  }
}
