import 'package:clean_arctitcher/core/utils/enums.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movies_event.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_now_playing_movies_usecases.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPlayingMoviesUseCases getPlayingMoviesUseCases;
  MoviesBloc(this.getPlayingMoviesUseCases) : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result =
          await getPlayingMoviesUseCases.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
                nowPlayingMovies: r,
                nowPlayingState: RequestState.loaded,
              )));
    });
  }
}
