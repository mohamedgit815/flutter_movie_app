class AppConstance {

  final String appKey = 'c3435cfe40aeb079689227d82bf921d3';

   final String baseUrl = 'https://api.themoviedb.org/3/movie';

   final String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

   String imageUrl(String path) => "$baseImageUrl$path" ;

}