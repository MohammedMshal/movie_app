import 'package:clean_arctitcher/movies/presintaion/controller/movie_detail_controller/recommendtion.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
      );
}
