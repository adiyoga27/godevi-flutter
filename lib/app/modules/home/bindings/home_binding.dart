import 'package:get/get.dart';

import 'package:godevi/app/modules/home/controllers/dashboard_controller.dart';
import 'package:godevi/app/modules/home/controllers/invoice_controller.dart';
import 'package:godevi/app/modules/home/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<InvoiceController>(
      () => InvoiceController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
