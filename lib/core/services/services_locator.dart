import 'package:clean_arctitcher/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_arctitcher/movies/data/repository/movies_repository.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_top_rate_movies_usecases.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movies/domain/usecases/get_now_playing_movies_usecases.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    //bloc
    getIt.registerFactory(() => MoviesBloc(
          getIt(),
          getIt(),
          getIt(),
        ));
    //use cases
    getIt.registerLazySingleton(() => GetPlayingMoviesUseCases(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCases(getIt()));
    getIt.registerLazySingleton(() => GetTopRatMoviesUseCases(getIt()));
    //Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(getIt()));
    //Data Source
    getIt.registerLazySingleton<BaseRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
