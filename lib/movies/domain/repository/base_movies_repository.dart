import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_recommendation_usecases.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movie_detail_controller/recommendtion.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTapRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameter parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters
      );

}