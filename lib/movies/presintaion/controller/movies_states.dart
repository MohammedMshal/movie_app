import 'package:clean_arctitcher/movies/presintaion/controller/enums.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;

  RequestState nowPlayingState;
  final String message;

  MoviesState(
      {this.nowPlayingState = RequestState.loading,
      this.message = '',
      this.nowPlayingMovies = const []});

  @override
  // TODO: implement props
  List<Object?> get props => [nowPlayingMovies,nowPlayingState,message];
}
