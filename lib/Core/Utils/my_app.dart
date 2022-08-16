import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Core/Utils/route_builder.dart';
import 'package:flutter_architecture_api_app/Core/app.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Screens/MovieHome/main_movie_screen.dart';
import 'package:flutter_offline/flutter_offline.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Movies Demo' ,
      restorationScopeId: 'root' ,
      onGenerateRoute: RouteGenerators.onGenerate ,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: App.color.normalGrey.shade900
      ),


      //initialRoute: RouteGenerators.posts ,
      //initialRoute: RouteGenerators.movie,
      
      home: OfflineBuilder(
          connectivityBuilder: (
          BuildContext context ,
          ConnectivityResult connectivity ,
          Widget child ,
      ) {
            final bool _connected = connectivity != ConnectivityResult.none;
            return App.conditional(
                condition: _connected,
                builder: (BuildContext context) => const  MainMovieScreen() ,
                fallback: (BuildContext context) => App.offlineBuilderScreen
            );
      } ,
      child: App.offlineWidget
      ) ,
    );
  }
}