import 'package:get/get.dart';
import 'package:movie_app/pages/homepage.dart';

class RouteHelper{
  static const String initial="/";
  static const String homepage="/home";

  static String getInitial()=>'$initial';
  static String getHomePage()=>'$homepage';

  static List<GetPage> route=[
    GetPage(name: initial, page: ()=>const HomePage(),
    transition: Transition.fade,
    ),
  ];
}