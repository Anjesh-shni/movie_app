import 'package:get/get.dart';
import 'package:movie_app/data/api_client.dart';

class MovieRepository extends GetxService{
  final ApiClient apiClient;

  MovieRepository({required this.apiClient});

  Future<Response> getMovieList()async{
   return await apiClient.getData("end point url");
  }
}