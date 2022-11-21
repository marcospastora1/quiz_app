import 'package:get/get.dart';
import 'package:quiz_app/presentation/home/controller/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
