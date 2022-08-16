import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Core/Services/service_locator.dart';
import 'package:flutter_architecture_api_app/Core/Utils/responsive_builder.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/movie_bloc.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/movie_event.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Screens/MovieHome/mobile_movie_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MainMovieScreen extends StatefulWidget {

  const MainMovieScreen({Key? key}) : super(key: key);

  @override
  State<MainMovieScreen> createState() => _MainMovieScreenState();
}

class _MainMovieScreenState extends State<MainMovieScreen> {

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> ServiceLocator.sl<MovieBloc>()
        ..add(GetNowPlayingMovieEvent())
        ..add(GetPopularMovieEvent())
        ..add(GetTopRatedMovieEvent()),
      child: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints) {
          return ResponsiveBuilderScreen(
            mobile: MobileMoviePage(constraints: constraints) ,
            deskTop: null ,
            tablet: null ,
          );
        }
      ),
    );
  }
}
