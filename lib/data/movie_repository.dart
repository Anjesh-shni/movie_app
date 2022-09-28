import 'package:get/get.dart';
import 'package:movie_app/constant/api_constant_url.dart';
import 'package:movie_app/data/api_client.dart';

class MovieRepository extends GetxService{
  final ApiClient apiClient;

  MovieRepository({required this.apiClient});

  Future<Response> getMovieList()async{
   return await apiClient.getData(AppConstant.POPULAR_MOVIE_LIST);
  }
}