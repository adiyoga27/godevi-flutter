import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:godevi/app/models/hotelListData.dart';
import 'package:godevi/app/modules/introduction/views/introduction_view.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  late AnimationController animationController;
  var hotelList = HotelListData.hotelList;
  var pageController = PageController(initialPage: 0);
  var pageViewModelData = <PageViewData>[];
  late Timer sliderTimer;
  var currentShowIndex = 0;
  final count = 0.obs;
  @override
  void onInit() {
    pageViewModelData.add(PageViewData(
      titleText: 'Cape Town',
      subText: 'Extraordinary five-star\noutdoor activites',
      assetsImage: 'assets/images/explore_2.jpg',
    ));
    pageViewModelData.add(PageViewData(
      titleText: 'Find best deals',
      subText: 'Extraordinary five-star\noutdoor activites',
      assetsImage: 'assets/images/explore_1.jpg',
    ));
    pageViewModelData.add(PageViewData(
      titleText: 'Find best deals',
      subText: 'Extraordinary five-star\noutdoor activites',
      assetsImage: 'assets/images/explore_3.jpg',
    ));

    sliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(Get.width,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(Get.width * 2,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    animationController.forward();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    sliderTimer?.cancel();

    super.onClose();
  }

  void increment() => count.value++;
}
