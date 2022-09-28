import 'package:get/get.dart';
import 'package:movie_app/pages/homepage.dart';
import 'package:movie_app/pages/splash_screen.dart';

class RouteHelper{
  static const String initial="/";
  static const String homepage="/home";
  static const String splashScreen="/splash";

  static String getInitial()=>'$initial';
  static String getHomePage()=>'$homepage';
  static String getSplashPage()=>'$splashScreen';

  static List<GetPage> route=[
     GetPage(name: splashScreen, page: ()=>const SplashScreen(),
    transition: Transition.fade,
    ),
    GetPage(name: initial, page: ()=>const HomePage(),
    transition: Transition.fade,
    ),
  ];
}