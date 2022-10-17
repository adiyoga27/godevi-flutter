import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:godevi/app/modules/introduction/views/introduction_view.dart';

class IntroductionController extends GetxController {
  //TODO: Implement IntroductionController

  var pageController = PageController(initialPage: 0);
  var pageViewModelData = <PageViewData>[];
  late Timer sliderTimer;
  var currentShowIndex = 0;

  final count = 0.obs;
  @override
  void onInit() {
    pageViewModelData.add(PageViewData(
      titleText: 'Plan your trips',
      subText: 'book one of your unique hotel to\nescape the ordinary',
      assetsImage: 'assets/images/introduction1.png',
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'Find best deals',
      subText:
          'Find deals for any season from cosy\ncountry homes to city flats',
      assetsImage: 'assets/images/introduction2.png',
    ));

    pageViewModelData.add(PageViewData(
      titleText: 'Best travelling all time',
      subText:
          'Find deals for any season from cosy\ncountry homes to city flats',
      assetsImage: 'assets/images/introduction3.png',
    ));

    sliderTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
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
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
