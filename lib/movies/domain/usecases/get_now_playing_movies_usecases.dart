
import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetPlayingMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetPlayingMoviesUseCases(this.baseMoviesRepository);
  Future<Either<Failure, List<Movie>>> execute() async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}