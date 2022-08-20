import 'package:clean_arctitcher/core/error/exceptions.dart';
import 'package:clean_arctitcher/core/error/failure.dart';
import 'package:clean_arctitcher/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
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
    } on ServerException catch(failuer){
      return left(ServerFailure(failuer.errorModel.statusMessage));
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
  Future<Either<Failure, MovieDetail>> getMovieDetails() {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }
}
