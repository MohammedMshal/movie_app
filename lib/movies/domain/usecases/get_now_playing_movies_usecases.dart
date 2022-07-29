
import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';

class GetPlayingMoviesUseCases{
  final BaseMoviesRepository baseMoviesRepository;
  GetPlayingMoviesUseCases(this.baseMoviesRepository);
  Future<List<Movie>> execute() async{
    return await baseMoviesRepository.getNowPlaying();
  }
}