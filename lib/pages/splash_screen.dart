import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/movie_controller.dart';
import 'package:movie_app/reusable_widget/big_text.dart';
import 'package:movie_app/route/route_helper.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    _loadResource();
    controller= AnimationController(vsync: this, duration:const Duration(seconds: 2))..forward();
    animation=CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 2), ()=>Get.offNamed(RouteHelper.getInitial()));
  }
   Future<void>_loadResource()async{
    await Get.find<MovieController>().PopularMovieList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ScaleTransition(
          scale: animation,
          child: Center(
            child: Image.asset("assets/images/logo.jpg",
            width: 400,
            height: 400,
            fit:BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Center(
          child: BigText(text: "Welcome",size: 30,color: Colors.white,),
          
        ),
      ],),
    );
  }
}