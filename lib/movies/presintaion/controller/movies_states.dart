import 'package:clean_arctitcher/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

   const MoviesState({
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.nowPlayingMovies = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [nowPlayingMovies, nowPlayingState, nowPlayingMessage];
}
