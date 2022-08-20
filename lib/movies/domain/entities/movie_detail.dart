import 'package:equatable/equatable.dart';

class MovieDatail extends Equatable {
  final List<Genres> genres;
  final String backdropPath;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final String voteAverage;

  const MovieDatail({
    required this.genres,
    required this.backdropPath,
    required this.id,
    required this.overView,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props =>
      [
        backdropPath,
        id,
        overView,
        releaseDate,
        runTime,
        title,
        voteAverage,
        genres,
      ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
