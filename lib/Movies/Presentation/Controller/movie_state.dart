import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_api_app/Core/Utils/enums.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';

class MovieState extends Equatable {

  final List<MovieEntities> nowPlayMovies;
  final RequestsState nowPlayState;
  final String nowPlayMessage;

  final List<MovieEntities> popularMovies;
  final RequestsState popularState;
  final String popularMessage;

  final List<MovieEntities> topRatedMovies;
  final RequestsState topRatedState;
  final String topRatedMessage;


  const MovieState({
     this.nowPlayMovies = const [],
     this.nowPlayState = RequestsState.loading,
     this.nowPlayMessage = '',


     this.popularMovies = const [],
     this.popularState = RequestsState.loading,
     this.popularMessage  = '',


     this.topRatedMovies = const [],
     this.topRatedState = RequestsState.loading,
     this.topRatedMessage  = ''
  });


  MovieState copyWith({
    List<MovieEntities>? nowPlayMovies ,
    RequestsState? nowPlayState ,
    String? nowPlayMessage ,

    List<MovieEntities>? popularMovies ,
    RequestsState? popularState ,
    String? popularMessage ,

    List<MovieEntities>? topRatedMovies ,
    RequestsState? topRatedState ,
    String? topRatedMessage
}) {
    return MovieState(
        nowPlayMovies: nowPlayMovies ?? this.nowPlayMovies ,
        nowPlayState: nowPlayState ?? this.nowPlayState ,
        nowPlayMessage: nowPlayMessage ?? this.nowPlayMessage ,
        popularMovies: popularMovies ?? this.popularMovies ,
        popularState: popularState ?? this.popularState ,
        popularMessage: popularMessage ?? this.popularMessage ,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies ,
        topRatedState: topRatedState ?? this.topRatedState ,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage
    );
  }


  @override
  List<Object?> get props => [
    nowPlayMovies , nowPlayState , nowPlayMessage ,
    popularMovies , popularState , popularMessage ,
    topRatedMovies , topRatedState , topRatedMessage
  ];

}