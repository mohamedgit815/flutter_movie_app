import 'package:dio/dio.dart';
import 'package:flutter_architecture_api_app/Core/Error/error_message_model.dart';
import 'package:flutter_architecture_api_app/Core/Error/exception.dart';
import 'package:flutter_architecture_api_app/Core/Utils/app_constance.dart';
import 'package:flutter_architecture_api_app/Movies/Data/Models/movie_details_model.dart';
import 'package:flutter_architecture_api_app/Movies/Data/Models/movies_model.dart';
import 'package:flutter_architecture_api_app/Movies/Domain/UseCase/get_data_by_id_usecase.dart';


abstract class BaseMovieDataSource {
  final AppConstance constance = AppConstance();

  Future<List<MoviesModel>> getNowPlayingData();

  Future<List<MoviesModel>> getPopularData();

  Future<List<MoviesModel>> getTopRatedData();

  Future<MovieDetailsModel> getDataById(MovieDetailsParameters id);

}


class MovieDataSource extends BaseMovieDataSource {

  @override
  Future<List<MoviesModel>> getNowPlayingData() async {

    final Response _response = await Dio()
        .getUri(Uri.parse('${constance.baseUrl}/now_playing?api_key=${constance.appKey}'));

    final Map<String,dynamic> _map = _response.data;
    final List<dynamic> _data = _map['results'];

    if(_response.statusCode == 200) {
      return _data.map((e) => MoviesModel.fromJson(e)).toList();
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }

  }


  @override
  Future<List<MoviesModel>> getPopularData() async {
    final Response _response = await Dio()
        .getUri(Uri.parse('${constance.baseUrl}/popular?api_key=${constance.appKey}'));

    final Map<String,dynamic> _map = _response.data;
    final List<dynamic> _data = _map['results'];

    if(_response.statusCode == 200) {
      return _data.map((e) => MoviesModel.fromJson(e)).toList();
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }


  @override
  Future<List<MoviesModel>> getTopRatedData() async {
    final Response _response = await Dio()
        .getUri(Uri.parse('${constance.baseUrl}/top_rated?api_key=${constance.appKey}'));

    final Map<String,dynamic> _map = _response.data;
    final List<dynamic> _data = _map['results'];

    if(_response.statusCode == 200) {
      return _data.map((e) => MoviesModel.fromJson(e)).toList();
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }


  @override
  Future<MovieDetailsModel> getDataById(MovieDetailsParameters id) async {
    final Response _response = await Dio().getUri(Uri.parse("${constance.baseUrl}/${id.movieDetailsId}?api_key=${constance.appKey}"));

    if(_response.statusCode == 200) {
      return MovieDetailsModel.fromJson(_response.data);
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromApp(_response.data));
    }
  }

}