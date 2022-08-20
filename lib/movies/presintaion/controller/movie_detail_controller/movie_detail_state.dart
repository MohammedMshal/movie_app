part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState requestState;
  final String movieDetailsMessage;

  const MovieDetailState({
    this.movieDetail,
    this.requestState = RequestState.loading,
    this.movieDetailsMessage = '',
  });
  MovieDetailState copyWith({
    MovieDetail? movieDetail ,
     RequestState? requestState,
     String? movieDetailsMessage,
})=> MovieDetailState(
    movieDetail: movieDetail ?? this.movieDetail,
    movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    requestState: requestState ?? this.requestState,
  );
  @override
  List<Object?> get props => [
        movieDetail,
        requestState,
        movieDetailsMessage,
      ];
}
