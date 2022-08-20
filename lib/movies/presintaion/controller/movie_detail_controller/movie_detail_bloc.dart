import 'dart:async';

import 'package:clean_arctitcher/core/utils/enums.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailsUseCases)
      : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  final GetMovieDetailsUseCases getMovieDetailsUseCases;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailState> emit) async {
    final result =
    await getMovieDetailsUseCases(MovieDetailsParameter(movieId: event.id));
    result.fold((l) => emit(state.copyWith(
      requestState: RequestState.error,
      movieDetailsMessage: l.message,
    )), (r) =>
        emit( state.copyWith(
          movieDetail: r,
          requestState: RequestState.loaded,

        )));
  }
}
