import 'package:clean_arctitcher/movies/presintaion/controller/movies_bloc.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movies_event.dart';
import 'package:clean_arctitcher/movies/presintaion/controller/movies_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc()
          ..add(GetNowPlayingEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          print(state);
          return const Scaffold();
        },
      ),
    );
  }
}