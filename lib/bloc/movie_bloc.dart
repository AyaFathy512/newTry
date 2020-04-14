import 'package:flutterday2movies/data_access_layer/model/moviemodel.dart';
import 'package:flutterday2movies/data_access_layer/repository/movie_repo.dart';

class MovieBloc{
  Future<List<Movie>> movieDisplay() async{
    List<Movie> allMovies = await MovieRepository().movies();
    return allMovies;
  }
}