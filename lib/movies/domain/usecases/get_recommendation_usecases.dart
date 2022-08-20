import 'package:clean_arctitcher/core/error/failure.dart';
import 'package:clean_arctitcher/core/use_case/base_use_case.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movie_detail_controller/recommendtion.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendation
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendation(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}