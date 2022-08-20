import 'package:clean_arctitcher/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.genres,
      required super.backdropPath,
      required super.id,
      required super.overView,
      required super.releaseDate,
      required super.runTime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        genres: List<GenresModel>.from(json['genres'].map((x) => GenresModel.fromJson(x))),
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overView: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
      );
}

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'],
        name: json['name'],
      );
}
