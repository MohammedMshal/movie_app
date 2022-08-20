import 'package:clean_arctitcher/core/error/exceptions.dart';
import 'package:clean_arctitcher/core/network/api_constans.dart';
import 'package:clean_arctitcher/core/network/error_model.dart';
import 'package:clean_arctitcher/movies/data/model/movie_details_model.dart';
import 'package:clean_arctitcher/movies/data/model/movies_model.dart';
import 'package:clean_arctitcher/movies/data/model/recommendation_model.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_recommendation_usecases.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource{
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameter parameters);

  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviePath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameter parameters) async{
    final response = await Dio().get(ApiConstance.moviesDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
    final response = await Dio().get(
        ApiConstance.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }}