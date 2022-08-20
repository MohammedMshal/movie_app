part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetMovieDetailsEvent extends MovieDetailEvent {
  final int id;


  const GetMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetEventRecommendation extends MovieDetailEvent {
  final int id;

  const GetEventRecommendation(this.id);

  @override
  List<Object> get props => [id];
}