import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_api_app/Core/Error/failure.dart';
import 'package:flutter_architecture_api_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Repository/base_movies_repository.dart';


class GetDataByIdUseCase extends BaseUseCase<MovieDetailsEntities , MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;


  GetDataByIdUseCase(this.baseMoviesRepository);


  @override
  Future<Either<Failure, MovieDetailsEntities>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getDataById(parameters);
  }

}


class MovieDetailsParameters extends Equatable {
  final int movieDetailsId;

  const MovieDetailsParameters({required this.movieDetailsId});


  @override
  List<Object?> get props => throw UnimplementedError();
}