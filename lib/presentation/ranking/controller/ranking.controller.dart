import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/domain/core/constants/storage.constants.dart';

class RankingController extends GetxController {
  final _storage = Get.find<GetStorage>();
  List<Map<String, dynamic>> getRanking() {
    final List<Map<String, dynamic>> ranking =
        List.castFrom(_storage.read(StorageConstants.ranking));

    ranking.sort((a, b) => b['Pontos'].compareTo(a['Pontos']));
    return ranking;
  }
}
