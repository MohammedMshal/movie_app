import 'package:clean_arctitcher/core/error/failure.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T>{
  Future<Either<Failure, T>> call();
}