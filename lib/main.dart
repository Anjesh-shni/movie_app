import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/movie_controller.dart';
import 'package:movie_app/route/route_helper.dart';
import 'dependency/dependency_injection.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("-----------App Started-------------");
   return GetBuilder<MovieController>(builder: (_){
      return GetMaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: RouteHelper.getSplashPage(),
      getPages:RouteHelper.route,
    );
    });
  }
}

