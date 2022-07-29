import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overView;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAverage,
  });

  //use package equatable
  @override
  List<Object> get props =>
      [id, title, backdropPath, genreIds, overView, voteAverage,];


//use manual
/*
  //اصلاح مشكلة حفظ الدتا
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          backdropPath == other.backdropPath &&
          genreIds == other.genreIds &&
          overVeiw == other.overVeiw &&
          voteAverage == other.voteAverage;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      backdropPath.hashCode ^
      genreIds.hashCode ^
      overVeiw.hashCode ^
      voteAverage.hashCode;*/
}
