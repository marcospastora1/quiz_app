import 'package:get/get.dart';
import 'package:quiz_app/presentation/ranking/controller/ranking.controller.dart';

class RankingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankingController>(() => RankingController());
  }
}
