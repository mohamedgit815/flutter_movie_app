import 'package:flutter_architecture_api_app/Movies/Domain/Entities/movie_details_entities.dart';

class MovieDetailsModel extends MovieDetailsEntities {
  MovieDetailsModel({
    required String tagLine,
    required String homepage,
    required String status,
    required int budget
  }) : super(
      tagLine: tagLine,
      homepage: homepage,
      status: status,
      budget: budget
  );

  factory MovieDetailsModel.fromJson(Map<String,dynamic>json) {
   return MovieDetailsModel(
        tagLine: json['tagline'],
        homepage: json['homepage'],
        status: json['status'],
        budget: json['budget']
    );
  }
}