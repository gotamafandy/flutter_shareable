import 'package:core/movie_mapper.dart';
import 'package:core/movie_cloud_service.dart';
import 'package:core/get_movie_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shareable/movie_list.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final client = Client();

  get movieListViewModel {
    final mapper = MovieMapper();
    final service = MovieCloudService(
        client: client,
        key: "b445ca0b",
        host: "www.omdbapi.com",
        mapper: mapper);

    return GetMovieListViewModel<String>(service: service);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: MovieList(viewModel: movieListViewModel),
      ),
    );
  }
}
