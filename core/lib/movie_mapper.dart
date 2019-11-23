import 'dart:convert';
import 'mapper.dart';
import 'model/movie.dart';

class MovieMapper implements Mapper<String, List<Movie>> {
  @override
  List<Movie> transform(String response) {
    final parsed = json.decode(response);

    final list = parsed['Search'] as List;

    return list.map<Movie>((json) => Movie.fromJson(json)).toList();
  }
}