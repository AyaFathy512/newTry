import 'package:flutterday2movies/data_access_layer/model/moviemodel.dart';
import 'package:flutterday2movies/data_access_layer/api/network.dart';

class MovieApi {

  final String url = "https://api.androidhive.info/json/movies.json";

  Future<List<Movie>> fetchMovies() async {
    var jsonResponse = await HttpClient().get(url);
    return List<Movie>.from(
        jsonResponse.map((jsonEntry) => Movie.formJson(jsonEntry)));
  }
}

