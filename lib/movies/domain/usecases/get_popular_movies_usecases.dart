import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';

import '../entities/movie.dart';

class GetPopularMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCases(this.baseMoviesRepository);
  Future<List<Movie>> execute()async{
    return await baseMoviesRepository.getPopularMovies();
  }
}