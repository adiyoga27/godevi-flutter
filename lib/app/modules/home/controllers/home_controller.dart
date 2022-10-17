// ignore_for_file: constant_identifier_names

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:godevi/app/models/hotelListData.dart';
import 'package:godevi/app/modules/dashboard/views/dashboard_view.dart';
import 'package:godevi/app/modules/home/views/home_view.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  late AnimationController animationController;
  var hotelList = HotelListData.hotelList;

  Widget indexView = const HomeView();
  BottomBarType bottomBarType = BottomBarType.Home;

  final count = 0.obs;
  @override
  void onInit() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    indexView = const HomeView();
    animationController..forward();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController.dispose();

    super.onClose();
  }

  void increment() => count.value++;

  void tabClick(BottomBarType tabType) {
    if (tabType != bottomBarType) {
      bottomBarType = tabType;
      animationController.reverse().then((f) {
        if (tabType == BottomBarType.Home) {
          indexView = DashboardView();
        } else if (tabType == BottomBarType.Reservasi) {
          // indexView = MyTripsScreen(
          //   animationController: animationController,
          // );
        } else if (tabType == BottomBarType.Profile) {
          // indexView = ProfileScreen(
          //   animationController: animationController,
          // );
        }
      });
    }
  }
}

enum BottomBarType { Home, Reservasi, Profile }
