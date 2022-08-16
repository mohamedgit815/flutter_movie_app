import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_api_app/Core/Utils/enums.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_details_entities.dart';


class MovieDetailsState extends Equatable {

  final MovieDetailsEntities? dataIdMovie;
  final RequestsState requestsState;
  final String message;

  const MovieDetailsState({
    this.dataIdMovie ,
    this.requestsState = RequestsState.loading ,
    this.message = ''
  });

  MovieDetailsState copyWith({
    MovieDetailsEntities? dataIdMovie ,
    RequestsState? requestsState ,
    String? message
     }) {
    return MovieDetailsState(
      dataIdMovie: dataIdMovie ?? this.dataIdMovie,
      requestsState: requestsState ?? this.requestsState,
      message: message ?? this.message
    );
  }


  @override
  List<Object?> get props => [dataIdMovie , requestsState , message];

}