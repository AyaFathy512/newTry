import 'package:flutterday2movies/data_access_layer/api/movie_api.dart';
import 'package:flutterday2movies/data_access_layer/model/moviemodel.dart';

class MovieRepository{
  Future<List<Movie>> movies() async => await MovieApi().fetchMovies();
}