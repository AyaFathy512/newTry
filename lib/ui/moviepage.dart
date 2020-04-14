import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterday2movies/bloc/movie_bloc.dart';
import 'package:flutterday2movies/data_access_layer/model/moviemodel.dart';
import 'package:flutterday2movies/ui/movie_details.dart';

class MoviePage extends StatefulWidget {
  final MovieBloc bloc = MovieBloc();
//  final List<Movie> movies;
//  MoviePage({Key key, @required this.movies}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
//  final Set<String> _saved = Set<String>();
  final Set<String> _save = Set<String>();
  int _counter = 0;

  String movieTitle = " ";

  @override
  void initState() {
    super.initState();
//    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: widget.bloc.movieDisplay(),
        builder: (_, AsyncSnapshot<List<Movie>> result) {
          if (result.hasData) {
            return new Scaffold(
              appBar: new AppBar(
                title: new Text("Movies"),
                actions: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text("$_counter"),
                      IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
                    ],
                  )
                ],
              ),
              body: new ListView.builder(
                itemCount:
                    result.requireData == null ? 0 : result.requireData.length,
                itemBuilder: (BuildContext context, int index) {

                  return _buildRow(result.requireData[index]);
                },
              ),
            );
          } else if (result.hasError) {
            return Center(
              child: Text("Error" + result.error.toString()),
            );
          } else {
            return Center(
              child: Text("no thing"),
            );
          }
        },
      ),
    );
  }

  Widget _buildRow(movie) {
    final alreadySaved = _save.contains(movie.title);
    @override
    void initState() {
      super.initState();
//      getDataFromSharedPreference().then(updateTitle);
    }
    return Container(
      padding: const EdgeInsets.all(10),
      width: 160,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(text: movie.title,
                  rate: movie.rating.toString(), year: movie.releaseYear.toString(),
                  image: movie.image.toString(),),
              ));
        },
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      movie.image,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        movie.title,
                      ),
                      Text(
                        movie.rating.toString(),
                      ),
                      Text(
                        "Release on : " + movie.releaseYear.toString(),
                      ),
                    ],
                  ),
                ],
              ),
              ListTile(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    chipForRow(movie.genre[0].toString(), Color(0xFFffa65)),
                    chipForRow(movie.genre[1].toString(), Color(0xFFffa65)),
                    chipForRow(movie.genre[2].toString(), Color(0xFFffa65)),
                  ],
                ),
                trailing: Icon(
                  alreadySaved ? Icons.favorite : Icons.favorite_border,
                  color: alreadySaved ? Colors.red : null,
                ),
                onTap: () {
                  setState(() {
                    if (alreadySaved) {
                      _save.remove(movie.title);
                      _counter = _counter - 1;
                    } else {
                      _save.add(movie.title);
                      _counter = _counter + 1;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateTitle(String title) {
    setState(() {
      this.movieTitle = title;
    });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _save.map(
            (movie) {
              return ListTile(
                title: Text(
                  movie,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            // Add 6 lines from here...
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          ); // ... to here.
        },
      ),
    );
  }

  hexColor(String colorHexCode) {
    String colorNew = '0xff' + colorHexCode;
    colorNew = colorNew.replaceAll("#", '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }

  Widget chipForRow(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(5.0),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(6.0),
    );
  }
}
