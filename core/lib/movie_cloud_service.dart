import 'service.dart';
import 'package:http/http.dart';
import 'mapper.dart';

class MovieCloudService<T> implements Service<String, T> {
  final String key;
  final String host;
  final Client client;
  final Mapper<String, T> mapper;

  const MovieCloudService({this.client, this.key, this.host, this.mapper});

  @override
  Future<T> execute(String request) async {

    final queries = {'apiKey': key, 's': request};
    final uri = Uri.https(host, '', queries);

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      return mapper.transform(response.body);
    } else {
      return throw Exception("Invalid response");
    }
  }
}