import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTapRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails();

}