class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'a1e61d8ab6adee09387cedd4e39a3026';
  static const String nowPlayingMoviePath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath = '$baseUrl/person/popular?api_key=$apiKey';
  static const String topRatedMoviePath = '$baseUrl/movie/top_rated?api_key=$apiKey';
}