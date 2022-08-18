import 'package:clean_arctitcher/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_arctitcher/movies/data/repository/movies_repository.dart';
import 'package:clean_arctitcher/movies/domain/entities/movie.dart';
import 'package:clean_arctitcher/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arctitcher/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List <Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();
    _getDate();
  }

  void _getDate() async {
    BaseRemoteDataSource baseRemoteDataSource = MovieRemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
        baseRemoteDataSource);
    final result =  await GetPlayingMoviesUseCases(baseMoviesRepository).execute();
    result.fold((l) => null, (r) {
movies = r;
    });
    print(result);
  }
}