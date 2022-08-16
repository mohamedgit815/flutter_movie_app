import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_entities.dart';

class MoviesModel extends MovieEntities {
  
  MoviesModel({
    required String backdropPath ,
    required String posterPath ,
    required String title ,
    required String releaseDate ,
    required String overview ,
    required int id ,
    required int voteCount ,
    required double voteAverage
  }) : super(
      backdropPath: backdropPath ,
      posterPath: posterPath ,
      title: title ,
      releaseDate: releaseDate ,
      overview: overview ,
      id: id ,
      voteCount: voteCount ,
      voteAverage: voteAverage
  );


  factory MoviesModel.fromJson(Map<String,dynamic>json) {
    return MoviesModel(
        backdropPath: json['backdrop_path'] ,
        posterPath: json['poster_path'] ,
        title: json['title'] ,
        releaseDate: json['release_date'] ,
        overview: json['overview'] ,
        id: json['id'] ,
        voteCount: json['vote_count'] ,
        voteAverage: json['vote_average'].toDouble()
    );
  }
  
}