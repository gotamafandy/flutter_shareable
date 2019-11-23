import 'package:angular/core.dart';
import 'package:core/get_movie_list_view_model.dart';
import 'package:core/list_view_model.dart';
import 'package:core/service.dart';
import 'package:core/model/movie.dart';
import 'package:core/mapper.dart';
import 'package:core/movie_cloud_service.dart';

import 'package:http/http.dart' as http;

const key = OpaqueToken<String>("key");
const host = OpaqueToken<String>("host");

Service<String, List<Movie>> provideService(http.Client client, @key String key, @host String host, Mapper mapper) {
  return MovieCloudService(client: client, key: key, host: host, mapper: mapper);
}

ListViewModel<String, List<Movie>> provideViewModel(Service service) {
  return GetMovieListViewModel<String>(service: service);
}