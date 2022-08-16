import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_api_app/Core/Error/failure.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/get_data_by_id_usecase.dart';

abstract class BaseMoviesRepository {

  Future<Either<Failure , List<MovieEntities>>> getNowPlayingData();

  Future<Either<Failure , List<MovieEntities>>> getPopularData();

  Future<Either<Failure , List<MovieEntities>>> getTopRatedData();

  Future<Either<Failure , MovieDetailsEntities>> getDataById(MovieDetailsParameters id);

}