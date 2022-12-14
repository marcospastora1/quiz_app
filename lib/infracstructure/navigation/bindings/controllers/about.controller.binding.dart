import 'package:get/get.dart';
import 'package:quiz_app/presentation/about/controllers/about.controller.dart';

class AboutControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
