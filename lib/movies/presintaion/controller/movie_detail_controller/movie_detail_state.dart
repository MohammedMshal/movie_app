part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState({
    this.movieDetail,
    this.requestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieRecommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });


  final MovieDetail? movieDetail ;
  final RequestState requestState;
  final String movieDetailsMessage;

  final List<Recommendation> movieRecommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? requestState,
    String? movieDetailsMessage,
    List<Recommendation>? movieRecommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) =>
      MovieDetailState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        requestState: requestState ?? this.requestState,
        movieRecommendation: movieRecommendation ?? this.movieRecommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage,
      );
  @override
  List<Object?> get props =>
      [
        movieDetail,
        requestState,
        movieDetailsMessage,
        movieRecommendation,
        recommendationMessage,
        recommendationState,
      ];


}
