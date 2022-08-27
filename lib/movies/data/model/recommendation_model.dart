import 'package:clean_arctitcher/movies/presintaion/controller/movie_detail_controller/recommendtion.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path'] ?? '/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg',
        id: json['id'],
      );
}
