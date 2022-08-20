import 'package:clean_arctitcher/core/error/exceptions.dart';
import 'package:clean_arctitcher/core/error/failure.dart';
import 'package:clean_arctitcher/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_recommendation_usecases.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movie_detail_controller/recommendtion.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){

      return  Left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result = await baseRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTapRatedMovies() async{
    final result = await baseRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
      return left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameter parameters) async{
    final result = await baseRemoteDataSource.getMoviesDetails(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return left(ServerFailure(failure.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result = await baseRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return left(ServerFailure(failure.errorModel.statusMessage));
    }
}
  }