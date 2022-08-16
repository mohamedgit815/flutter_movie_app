import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_api_app/Core/Error/failure.dart';
import 'package:flutter_architecture_api_app/Core/UseCase/base_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Repository/base_movies_repository.dart';

class PopularUseCase extends BaseUseCase<List<MovieEntities> , NoParameters> {

  final BaseMoviesRepository baseMoviesRepository;

  PopularUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntities>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularData();
  }

}