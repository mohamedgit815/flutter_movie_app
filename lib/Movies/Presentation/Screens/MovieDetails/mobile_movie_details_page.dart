import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Core/Utils/enums.dart';
import 'package:flutter_architecture_api_app/Core/Widgets/custom_widgets.dart';
import 'package:flutter_architecture_api_app/Core/app.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/MovieDetailsController/movie_details_bloc.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/MovieDetailsController/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MobileMovieDetailsPage extends StatefulWidget {
  final MovieEntities data;
  const MobileMovieDetailsPage({Key? key , required this.data}) : super(key: key);

  @override
  _MobileMovieDetailsPageState createState() => _MobileMovieDetailsPageState();
}

class _MobileMovieDetailsPageState extends State<MobileMovieDetailsPage> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieDetailsBloc , MovieDetailsState>(
        builder: (BuildContext context,MovieDetailsState state) {
          switch(state.requestsState) {
            case RequestsState.loading : return const Center(child: CircularProgressIndicator.adaptive());
            case RequestsState.loaded : return Column(
              children: [

                Expanded(
                    child: AnimatedContainer(
                      width: double.infinity ,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(App.constance.imageUrl(widget.data.backdropPath))
                      )),
                    )

                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'ReleaseDate: ${widget.data.releaseDate}'),
                      CustomText(text: 'VoteCount: ${widget.data.voteCount}'),
                      CustomText(text: 'VoteAverage: ${widget.data.voteAverage}'),


                      CustomText(text: 'Status: ${state.dataIdMovie!.status}'),
                      CustomText(text: 'TagLine: ${state.dataIdMovie!.tagLine}'),
                      CustomText(text: 'Budget: ${state.dataIdMovie!.budget}'),


                      CustomText(text: 'Overview: ${widget.data.overview}',maxLine: 1000,),

                    ],
                  ),
                )

              ],
            );
            case RequestsState.error : return  Center(child: Text(state.message));
          }
        }
    );
  }
}
