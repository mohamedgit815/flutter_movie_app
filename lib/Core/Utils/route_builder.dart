import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Screens/MovieDetails/main_movie_details_screen.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Screens/MovieHome/main_movie_screen.dart';


class RouteGenerators {

  static const String movie = '/MainMovieScreen';
  static const String posts = '/MainPostsScreen';
  static const String movieDetails = '/MainMovieDetailsScreen';


   static MaterialPageRoute<dynamic> _materialPageRoute(Widget page) {
    return MaterialPageRoute( builder: ( _ ) => page );
  }

   static CupertinoPageRoute<dynamic> _cupertinoPageRoute(Widget page) {
    return CupertinoPageRoute( builder: ( _ ) => page );
  }


  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch(settings.name) {


      case movie : return _materialPageRoute(const MainMovieScreen());

      case movieDetails :
        final MovieEntities _data = settings.arguments as MovieEntities;
        return _cupertinoPageRoute(MainMovieDetailsScreen(movieEntities: _data));



    }
    return null;
  }


}