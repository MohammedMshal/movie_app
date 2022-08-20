
import 'package:clean_arctitcher/core/use_case/base_use_case.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetPlayingMoviesUseCases extends BaseUseCase<List<Movie>>{
  final BaseMoviesRepository baseMoviesRepository;
  GetPlayingMoviesUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }

}