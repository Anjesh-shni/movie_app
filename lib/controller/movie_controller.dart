import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/movie_repository.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieController extends GetxController{
  final MovieRepository movieRepository;

  MovieController({required this.movieRepository});

   List<MovieModel> _popularMovieList=[];
   List<MovieModel> get PopularMovieList =>_popularMovieList;
   bool _isloaded=false;
   bool get isloaded=>_isloaded;


   Future<void> getPopularMovieList()async{
    Response response = await movieRepository.getMovieList();
    if(response.statusCode==200){
      _popularMovieList=[];
      _popularMovieList.addAll(response.body);
      _isloaded=true;
      update();
      debugPrint("Successfully got Movie List");
    }else{
      debugPrint("Could not get Movie List");
    }
   }
}