import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/infracstructure/navigation/navigation.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:quiz_app/initializer.dart';

Future<void> main() async {
  await Initializer.init();
  final initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GetMaterialApp(
        title: 'Quiz App',
        initialRoute: initialRoute,
        getPages: Nav.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
