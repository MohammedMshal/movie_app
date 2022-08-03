import 'package:clean_arctitcher/core/error/exceptions.dart';
import 'package:clean_arctitcher/core/network/error_model.dart';
import 'package:clean_arctitcher/movies/data/model/movies_model.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get('');
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
