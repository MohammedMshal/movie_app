import 'dart:async';

import 'package:clean_arctitcher/core/utils/enums.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_recommendation_usecases.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movie_detail_controller/recommendtion.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailsUseCases, this.getRecommendationUseCases)
      : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetEventRecommendationEvent>(_getMovieRecommendation);
  }

  final GetMovieDetailsUseCases getMovieDetailsUseCases;
  final GetRecommendationUseCases getRecommendationUseCases;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailState> emit) async {
    final result =
    await getMovieDetailsUseCases(MovieDetailsParameter(movieId: event.id));
    result.fold((l) =>
        emit(state.copyWith(
          requestState: RequestState.error,
          movieDetailsMessage: l.message,
        )), (r) =>
        emit(state.copyWith(
          movieDetail: r,
          requestState: RequestState.loaded,

        )));
  }


  FutureOr<void> _getMovieRecommendation(GetEventRecommendationEvent event,
      Emitter<MovieDetailState> emit) async {
    final result = await getRecommendationUseCases(
        RecommendationParameters(id: event.id));
    result.fold((l) =>
        emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        )), (r) =>
        emit(state.copyWith(
            movieRecommendation: r,
            recommendationState: RequestState.loaded
        )));
  }
}
