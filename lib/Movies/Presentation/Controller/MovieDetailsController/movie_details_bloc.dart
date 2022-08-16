import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_api_app/Core/Error/failure.dart';
import 'package:flutter_architecture_api_app/Core/Utils/enums.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/get_data_by_id_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/MovieDetailsController/movie_details_event.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/MovieDetailsController/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MovieDetailsBloc extends Bloc<MovieDetailsEvent , MovieDetailsState> {
  final GetDataByIdUseCase getDataByIdUseCase;

  MovieDetailsBloc(this.getDataByIdUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getDataById);
  }

  FutureOr<void> _getDataById(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final Either<Failure , MovieDetailsEntities> _result = await getDataByIdUseCase.call(MovieDetailsParameters(movieDetailsId: event.id));

    _result.fold(
            (l) => emit(state.copyWith(requestsState: RequestsState.error , message: l.message))
        ,
            (r) => emit(state.copyWith(requestsState: RequestsState.loaded , dataIdMovie: r))
    );
  }
}