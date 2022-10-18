import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:godevi/app/core/utils/helpers.dart';
import 'package:godevi/app/modules/home/controllers/invoice_controller.dart';
import 'package:godevi/app/services/storage/storage.dart';
import 'package:mixins/mixins.dart';

class DashboardController extends GetxController {
  late InvoiceController invoicesController;

  DateTime? backPressTime;
  ScrollController homeScrollController = ScrollController();

  // on will pop up
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();

    if (backPressTime == null || now.difference(backPressTime!) > Duration(seconds: 2)) {
      backPressTime = now;
      toast.info('Tap sekali lagi untuk keluar');
      return Future.value(false);
    }

    return Future.value(true);
  }

  // navigation
  RxInt pageActive = 0.obs;
  List hasVisited = [0];

  Future navigate(int index) async {
    switch (index) {
      case 0:
        if (pageActive.value == index) {
          Mixins.scrollTo(homeScrollController, to: AxisDirection.up);
        }
        break;

      case 2: // invoices
        // bool hasCheckedOut = await storage.read('invoice') != null;

        // if (!hasVisited.contains(index) || hasCheckedOut) {
        //   invoicesController.getInvoices(reload: true);
        //   storage.remove('invoice');
        // }
        break;

      case 3: // ratings
        // if (!hasVisited.contains(index)) {
        //   ratingController.getTopRol(reload: true);
        // }
        break;

     
      default:
    }

    hasVisited.addIf(!hasVisited.contains(index), index);
    pageActive.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    invoicesController = Get.put(InvoiceController());
  }
  
}
