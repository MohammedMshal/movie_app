import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';

class GetTopRatMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatMoviesUseCases(this.baseMoviesRepository);
  Future<List<Movie>> execute()async{
    return await baseMoviesRepository.getTapRatedMovies();
  }
}