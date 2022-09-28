import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/route/route_helper.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("-----------App Started-------------");
    return GetMaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: RouteHelper.getInitial(),
      getPages:RouteHelper.route,
    );
  }
}

