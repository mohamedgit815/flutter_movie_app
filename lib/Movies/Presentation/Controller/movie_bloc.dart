import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_api_app/Core/Error/failure.dart';
import 'package:flutter_architecture_api_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_architecture_api_app/Core/Utils/enums.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/now_playing_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/popular_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/top_rated_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/movie_event.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MovieBloc extends Bloc<MovieEvent , MovieState> {

  final NowPlayingUseCase nowPlayingUseCase ;

  final PopularUseCase popularUseCase ;

  final TopRatedUseCase topRatedUseCase ;


  MovieBloc(this.nowPlayingUseCase, this.popularUseCase, this.topRatedUseCase) : super(const MovieState()) {

    on<GetNowPlayingMovieEvent>(_getNowPlayingMovieBloc);

    on<GetPopularMovieEvent>(_getPopularMovieBloc);

    on<GetTopRatedMovieEvent>(_getTopRatedPopularMovieBloc);

  }


  FutureOr<void> _getNowPlayingMovieBloc(GetNowPlayingMovieEvent event, Emitter<MovieState> emit) async {
    final Either<Failure , List<MovieEntities>> _result = await nowPlayingUseCase(const NoParameters());

    return _result.fold(
            (l) => emit(state.copyWith( nowPlayState: RequestsState.error , nowPlayMessage: l.message ))
        ,
            (r) => emit(state.copyWith( nowPlayState: RequestsState.loaded , nowPlayMovies: r ))
    );

  }


  FutureOr<void> _getPopularMovieBloc(GetPopularMovieEvent event, Emitter<MovieState> emit) async {
    final Either<Failure , List<MovieEntities>> _result = await popularUseCase(const NoParameters());

    return _result.fold(
            (l) => emit(state.copyWith( popularState: RequestsState.error , popularMessage: l.message ))
        ,
            (r) => emit(state.copyWith( popularState: RequestsState.loaded , popularMovies: r ))
    );
  }


  FutureOr<void> _getTopRatedPopularMovieBloc(GetTopRatedMovieEvent event, Emitter<MovieState> emit) async {
    final Either<Failure , List<MovieEntities>> _result = await topRatedUseCase(const NoParameters());

    return _result.fold(
            (l) => emit(state.copyWith( topRatedState: RequestsState.error , topRatedMessage: l.message ))
        ,
            (r) => emit(state.copyWith( topRatedState: RequestsState.loaded , topRatedMovies: r ))
    );

  }


}