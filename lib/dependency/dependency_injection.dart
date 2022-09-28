import 'package:get/get.dart';
import 'package:movie_app/controller/movie_controller.dart';
import 'package:movie_app/data/api_client.dart';
import 'package:movie_app/data/movie_repository.dart';

Future<void> init()async{

  //for Api
  Get.lazyPut(()=>ApiClient(appBaseurl: ""));

  //for repository
  Get.lazyPut(() => MovieRepository(apiClient: Get.find()));

  //for controller
  Get.lazyPut(() => MovieController(movieRepository: Get.find()));
}