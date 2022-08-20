import 'package:clean_arctitcher/core/error/failure.dart';
import 'package:clean_arctitcher/core/use_case/base_use_case.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetailsUseCases extends BaseUseCase<MovieDetail, MovieDetailsParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameter parameters) async {
    return await baseMoviesRepository.getMovieDetails();
  }
}

class MovieDetailsParameter extends Equatable {
  final int movieId;

  const MovieDetailsParameter({required this.movieId});

  @override
  List<Object> get props => [id];
}

