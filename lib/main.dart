import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/domain/core/constants/storage.constants.dart';
import 'package:quiz_app/infracstructure/navigation/navigation.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:quiz_app/initializer.dart';

Future<void> main() async {
  await Initializer.init();
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _Main createState() => _Main();
}

class _Main extends State<Main> with WidgetsBindingObserver {
  final _storage = Get.find<GetStorage>();
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  var timer = Timer(const Duration(seconds: 0), () {});

/*   void startTimer() {
    timer = Timer(const Duration(minutes: 5), () async {
      await _storage.remove(StorageConstants.jogador);
    });
  }

  void cancelTimer() {
    timer.cancel();
  } */

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_storage.hasData(StorageConstants.jogador)) {
      /* /*  if (state == AppLifecycleState.paused) {
        startTimer();
      } else */
      if (state == AppLifecycleState.resumed) {
        startTimer();
      } else */
      if (state == AppLifecycleState.inactive) {
        await _storage.remove(StorageConstants.jogador);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: Routes.initialRoute,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: GetMaterialApp(
              title: 'Quiz App',
              initialRoute: snapshot.data,
              getPages: Nav.routes,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
