class ApiUrl {
  static String baseUrl =
      "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc";
  static String trending = "$baseUrl/trending";
  static String movies = "$baseUrl/";
  static String language = "$baseUrl/configuration/languages";
  static String imageBase = "https://image.tmdb.org/t/p/w500/";
}
