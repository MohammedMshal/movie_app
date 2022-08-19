import 'package:clean_arctitcher/core/utils/enums.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movies_event.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_now_playing_movies_usecases.dart';
import '../../domain/usecases/get_popular_movies_usecases.dart';
import '../../domain/usecases/get_top_rate_movies_usecases.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPlayingMoviesUseCases getPlayingMoviesUseCases;
  final GetPopularMoviesUseCases getPopularMoviesUseCases;
  final GetTopRatMoviesUseCases getTopRatMoviesUseCases;

  MoviesBloc(this.getPlayingMoviesUseCases, this.getTopRatMoviesUseCases,
      this.getPopularMoviesUseCases)
      : super(const MoviesState()) {

    //Get Now Playing
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getPlayingMoviesUseCases.execute();
      result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });

    //Get popular
    on<GetPopularEvent>((event, emit) async {
      final result = await getPopularMoviesUseCases.execute();
      result.fold(
            (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
            (r) => emit(
          state.copyWith(
            popularMovies: r,
            popularState: RequestState.loaded,
          ),
        ),
      );
    });



  }
}