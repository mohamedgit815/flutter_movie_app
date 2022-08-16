import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Core/Utils/enums.dart';
import 'package:flutter_architecture_api_app/Core/Utils/route_builder.dart';
import 'package:flutter_architecture_api_app/Core/Widgets/custom_widgets.dart';
import 'package:flutter_architecture_api_app/Core/app.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/movie_bloc.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MobileMovieWidgets {

  BlocBuilder<MovieBloc , MovieState> getNowPlayingMovieWidget() {
    return BlocBuilder<MovieBloc , MovieState>(
        builder: (BuildContext context , MovieState state) {
          switch( state.nowPlayState ) {

            case RequestsState.loading : return  App.defaultsCarouselShimmer;

            case RequestsState.loaded :
              return CarouselSlider.builder(
                  itemCount: state.nowPlayMovies.length ,
                  itemBuilder: (BuildContext context , int i , int l) {
                    final MovieEntities _data = state.nowPlayMovies.elementAt(i);
                    return Container(
                      key: ValueKey(_data.id),
                      width: double.infinity ,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover ,
                              image: NetworkImage(App.constance.imageUrl(_data.backdropPath))
                          )
                      ),
                    );
                  },
                  options: CarouselOptions(
                      height: double.infinity ,
                      autoPlay: true ,
                      reverse: false ,
                     // autoPlayInterval: const Duration(milliseconds: 2000)
                  )
              );

            case RequestsState.error : return Center(child: Text(state.nowPlayMessage));

          }
        }
    );
  }


  ScrollConfiguration getPopularWidget({required BuildContext context ,required BoxConstraints constraints}) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch ,
        PointerDeviceKind.mouse ,
      }),
      child: BlocBuilder<MovieBloc , MovieState>(
          builder: (BuildContext context , MovieState state) {
            switch(state.topRatedState) {
              case RequestsState.loading : return App.defaultPopularShimmer(constraints);
              case RequestsState.loaded : return ListView.builder(
                  itemCount: state.popularMovies.length ,
                  scrollDirection: Axis.horizontal ,
                  key: const PageStorageKey<String>("PopularScreenKey"),
                  itemBuilder: (BuildContext context ,int i) {
                    final MovieEntities _data = state.popularMovies.elementAt(i);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteGenerators.movieDetails , arguments: _data);
                      },
                      child: AnimatedContainer(
                        key: ValueKey(_data.id) ,
                        width: constraints.maxHeight * 0.3 ,
                        margin: const EdgeInsets.all(10.0) ,
                        duration: const Duration(milliseconds: 300) ,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(App.constance.imageUrl(_data.backdropPath))
                            )
                        ),
                        child: Column(
                          children: [
                            const Spacer(),

                            Expanded(
                              child: Container(
                                width: double.infinity ,
                                decoration: BoxDecoration(
                                  color: App.color.normalBlack.withOpacity(0.5) ,
                                ) ,

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: CustomText(
                                          text: _data.title,
                                          color: App.color.normalWhite,
                                          maxLine: 1,
                                        ),
                                      ),
                                    ),


                                    Expanded(
                                    flex: 4,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                            child: CustomText(
                                              text: _data.overview,
                                              color: App.color.normalWhite,
                                              maxLine: 3,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );
              case RequestsState.error : return Center(child: Text(RequestsState.error.toString()));
            }
          }
      ),
    );
  }



  ScrollConfiguration getTopRatedWidget({required BuildContext context ,required BoxConstraints constraints}) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch ,
        PointerDeviceKind.mouse ,
      }),
      child: BlocBuilder<MovieBloc , MovieState>(
          builder: (BuildContext context , MovieState state) {
            switch(state.topRatedState) {
              case RequestsState.loading : return App.defaultPopularShimmer(constraints);
              case RequestsState.loaded : return ListView.builder(
                  itemCount: state.topRatedMovies.length ,
                  scrollDirection: Axis.horizontal ,
                  key: const PageStorageKey<String>("PopularScreenKey"),
                  itemBuilder: (BuildContext context ,int i) {
                    final MovieEntities _data = state.topRatedMovies.elementAt(i);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteGenerators.movieDetails , arguments: _data);
                      },
                      child: AnimatedContainer(
                        key: ValueKey(_data.id) ,
                        width: constraints.maxHeight * 0.3 ,
                        margin: const EdgeInsets.all(10.0) ,
                        duration: const Duration(milliseconds: 300) ,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(App.constance.imageUrl(_data.backdropPath))
                            )
                        ),
                        child: Column(
                          children: [
                            const Spacer(),

                            Expanded(
                              child: Container(
                                width: double.infinity ,
                                decoration: BoxDecoration(
                                  color: App.color.normalBlack.withOpacity(0.5) ,
                                ) ,

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: CustomText(
                                          text: _data.title,
                                          color: App.color.normalWhite,
                                          maxLine: 1,
                                        ),
                                      ),
                                    ),


                                    Expanded(
                                      flex: 4,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                            child: CustomText(
                                              text: _data.overview,
                                              color: App.color.normalWhite,
                                              maxLine: 3,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );
              case RequestsState.error : return Center(child: Text(RequestsState.error.toString()));
            }
          }
      ),
    );
  }


  Row writeKindMovies(String name){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      crossAxisAlignment: CrossAxisAlignment.center ,
      children: [
        CustomText(text: name ,fontWeight: FontWeight.bold,),
        //Text("data"),
      ],
    );
  }

}