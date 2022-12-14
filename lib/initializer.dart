import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/domain/core/constants/storage.constants.dart';
import 'package:quiz_app/presentation/shared/loading/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initStorage();
      await _initializeRanking();
      _initGlobalLoading();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static void _initGlobalLoading() {
    final loading = LoadingController();
    Get.put(loading);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Future<void> _initializeRanking() async {
    final _storage = Get.find<GetStorage>();
    _storage.hasData(StorageConstants.ranking)
        ? null
        : await _storage.write(StorageConstants.ranking, []);
  }
}
