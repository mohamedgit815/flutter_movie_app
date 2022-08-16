import 'package:flutter_architecture_api_app/Movies/Data/DataSource/movie_data_soruce.dart';
import 'package:flutter_architecture_api_app/Movies/Data/Repository/movies_repository.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/Repository/base_movies_repository.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/get_data_by_id_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/now_playing_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/popular_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/top_rated_usecase.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/MovieDetailsController/movie_details_bloc.dart';
import 'package:flutter_architecture_api_app/Movies/Presentation/Controller/movie_bloc.dart';
import 'package:get_it/get_it.dart';



class ServiceLocator {
 static final GetIt sl = GetIt.instance;


  void init() {
    /// Bloc
    sl.registerFactory<MovieBloc>(() => MovieBloc( sl() , sl() , sl() ));
    sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc( sl() ));


    /// Use Cases
    sl.registerLazySingleton<NowPlayingUseCase>(() => NowPlayingUseCase(sl()));
    sl.registerLazySingleton<PopularUseCase>(() => PopularUseCase(sl()));
    sl.registerLazySingleton<TopRatedUseCase>(() => TopRatedUseCase(sl()));
    sl.registerLazySingleton<GetDataByIdUseCase>(() => GetDataByIdUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));


    /// DataSource
    sl.registerLazySingleton<BaseMovieDataSource>(() => MovieDataSource());
  }
}