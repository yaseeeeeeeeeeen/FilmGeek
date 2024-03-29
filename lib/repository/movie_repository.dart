// import 'dart:convert';

// import 'package:either_dart/either.dart';
// import 'package:filmgeek/model/movie_model.dart';
// import 'package:filmgeek/utils/errors.dart';
// import 'package:http/http.dart' as http;

// typedef EitherMovies = Future<Either<AppExceptions, List<Movie>>>;

// class MovieRepository {
//   EitherMovies getMovies() async {
//     try {
//       List<Movie> movieList = [];
//       String url = "https://hoblist.com/api/movieList";
//       // Map<String, String> data = {
//       //   "category": "movies",
//       //   "language": "kannada",
//       //   "genre": "all",
//       //   "sort": "voting"
//       // };
//       final response = await _post(url: url, data: data);
//       for (Map<String, dynamic> movieData in response) {
//         final movie = Movie.fromJson(movieData);
//         movieList.add(movie);
//       }
//       return Right(movieList);
//     } catch (e) {
//       if (e is BadRequestExceptions) {
//         return Left(BadRequestExceptions());
//       } else if (e is InterntExceptions) {
//         return Left(InterntExceptions());
//       } else if (e is RequestTimeOutExceptions) {
//         return Left(RequestTimeOutExceptions());
//       } else {
//         return Left(BadRequestExceptions());
//       }
//     }
//   }

//   _post({required String url, required Map<String, String> data}) async {
//     final uri = Uri.parse(url);
//     final body = jsonEncode(data);
//     final response = await http.post(uri,
//         headers: {"Content-Type": "application/json"}, body: body);
//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(response.body);
//       return responseData["result"];
//     } else if (response.statusCode > 400 && response.statusCode < 500) {
//       throw BadRequestExceptions();
//     }
//   }
// }

import 'dart:convert';

import 'package:filmgeek/model/movie_model.dart';
import 'package:filmgeek/utils/api_urls.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final Map<String, String> headers = {"Content-Type": "application/json",'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMmI4YjMyOTZhYzNmMzJlN2U0ODljZjllOWI0Y2FjMCIsInN1YiI6IjY0ZmMyOWFiZGMxY2I0MDEzZDBlZTlhMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EctnY_xNk-FKiol0TSnR38q0FTBSmBD-59S3zOLba_I'};
  Future<Movie?> getMovies() async {
    final url = ApiUrl.baseUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final resp = jsonDecode(response.body);
      final data = Movie.fromJson(resp);
      return data;
    }
    return null;
  }
}
