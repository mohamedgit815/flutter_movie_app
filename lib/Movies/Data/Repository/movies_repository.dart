import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_api_app/Core/Error/error_message_model.dart';
import 'package:flutter_architecture_api_app/Core/Error/failure.dart';
import 'package:flutter_architecture_api_app/Movies/Data/DataSource/movie_data_soruce.dart';
import 'package:flutter_architecture_api_app/Movies/Data/Models/movies_model.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_details_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Repository/base_movies_repository.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/get_data_by_id_usecase.dart';


class MovieRepository extends BaseMoviesRepository {

  final BaseMovieDataSource baseMovieDataSource;

  MovieRepository(this.baseMovieDataSource);


  @override
  Future<Either<Failure, List<MovieEntities>>> getNowPlayingData() async {

    final List<MoviesModel> _result = await baseMovieDataSource.getNowPlayingData();

    try{
      return Right(_result);
    } on ErrorMessageModel catch(e) {
      return Left(ServerFailure(e.statusMessage));
    }

  }


  @override
  Future<Either<Failure, List<MovieEntities>>> getPopularData() async {

    final List<MoviesModel> _result = await baseMovieDataSource.getPopularData();

    try{
      return Right(_result);
    } on ErrorMessageModel catch(e) {
      return Left(ServerFailure(e.statusMessage));
    }

  }


  @override
  Future<Either<Failure, List<MovieEntities>>> getTopRatedData() async {

    final List<MoviesModel> _result = await baseMovieDataSource.getTopRatedData();

    try{
      return Right(_result);
    } on ErrorMessageModel catch(e) {
      return Left(ServerFailure(e.statusMessage));
    }

  }


  @override
  Future<Either<Failure, MovieDetailsEntities>> getDataById(MovieDetailsParameters id) async {
    final MovieDetailsEntities _result = await baseMovieDataSource.getDataById(id);

    try{
      return Right(_result);
    } on ErrorMessageModel catch(e){
      return Left(ServerFailure(e.statusMessage));
    }
  }

}