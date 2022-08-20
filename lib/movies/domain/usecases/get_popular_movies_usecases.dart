import 'package:clean_arctitcher/core/use_case/base_use_case.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCases extends BaseUseCase<List<Movie>, NoParameter>{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameters) async{
    return await baseMoviesRepository.getPopularMovies();
  }

}