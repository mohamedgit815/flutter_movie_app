import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Widgets/mobile_movie_widgets.dart';


class MobileMoviePage extends StatefulWidget {
  final BoxConstraints constraints;
  const MobileMoviePage({Key? key,required this.constraints}) : super(key: key);

  @override
  _MobileMoviePageState createState() => _MobileMoviePageState();
}

class _MobileMoviePageState extends State<MobileMoviePage> with MobileMovieWidgets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            flex: 7 ,
            child: getNowPlayingMovieWidget(),
          ) ,


          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0,left: 10.0,top: 10.0) ,
              child: writeKindMovies("Popular")
            ),
          ) ,


          Expanded(
            flex: 6 ,
            child: getPopularWidget(context: context, constraints: widget.constraints)
          ) ,


          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: writeKindMovies("Top Rated")
            ),
          ) ,


          Expanded(
            flex: 6 ,
            child: getTopRatedWidget(context: context, constraints: widget.constraints)
          )

        ],
      )
    );
  }
}
