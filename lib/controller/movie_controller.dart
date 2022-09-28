import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/movie_repository.dart';

class MovieController extends GetxController{
  final MovieRepository movieRepository;

  MovieController({required this.movieRepository});

   List<dynamic> _popularMovieList=[];
   List<dynamic> get PopularMovieList =>_popularMovieList;

   Future<void> getPopularMovieList()async{
    Response response = await movieRepository.getMovieList();
    if(response.statusCode==200){
      _popularMovieList=[];
      //_popularMovieList.addAll();
      update();
    }else{
      debugPrint("Could not get movie list");
    }
   }
}