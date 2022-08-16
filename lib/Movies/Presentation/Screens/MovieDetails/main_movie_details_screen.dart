import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Core/Services/service_locator.dart';
import 'package:flutter_architecture_api_app/Core/Utils/responsive_builder.dart';
import 'package:flutter_architecture_api_app/Core/Widgets/custom_widgets.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/MovieDetailsController/movie_details_bloc.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/MovieDetailsController/movie_details_event.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Screens/MovieDetails/mobile_movie_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MainMovieDetailsScreen extends StatelessWidget {

  final MovieEntities movieEntities;

  const MainMovieDetailsScreen({Key? key , required this.movieEntities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ServiceLocator.sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieEntities.id)),
      child: Scaffold(
        appBar: AppBar(title: CustomText(text: movieEntities.title,color: Colors.white,),centerTitle: true),
        body: LayoutBuilder(
              builder: (BuildContext context , BoxConstraints constraints) {
                return ResponsiveBuilderScreen(
                  mobile: MobileMovieDetailsPage(data: movieEntities) ,
                  deskTop: null ,
                  tablet: null ,
                );
              }
        ),
      ),
    );
  }
}
