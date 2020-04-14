import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterday2movies/ui/movie_details.dart';
import 'package:flutterday2movies/ui/moviepage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MaterialApp(
      home: new MoviePage(),
//      routes: {
//        MovieDetailsScreen.routeName:(ctx) => MovieDetailsScreen(),
//      },
    ));

//class HomePage extends StatefulWidget {
//  @override
//  HomePageState createState() => HomePageState();
//}
//
//class HomePageState extends State<HomePage> {
//  final Set _saved = Set();
//  final String url = "https://api.androidhive.info/json/movies.json";
//  List movies;
//  int _counter = 0;
//  String movieTitle = " ";
//
//  @override
//  void initState() {
//    super.initState();
//    this.getJsonData();
//  }
//
//  Future<String> getJsonData() async {
//    var response = await http
//        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//    print(response.body);
//    setState(() {
//      var convertDataToJson = json.decode(response.body);
//      movies = convertDataToJson;
//      for (int i = 0; i < movies.length; i++) {
//        saveInSharedPreference(movies[i]['title']);
//      }
//    });
//    return "Success";
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Movies"),
//        actions: <Widget>[
//          new Row(
//            children: <Widget>[
//              new Text("$_counter"),
//              IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
//            ],
//          )
//        ],
//      ),
//      body: new ListView.builder(
//        itemCount: movies == null ? 0 : movies.length,
//        itemBuilder: (BuildContext context, int index) {
//          return _buildRow(movies[index]);
//        },
//      ),
//    );
//  }
//
//  Widget _buildRow(movie) {
//    final alreadySaved = _saved.contains(movie);
//    @override
//    void initState() {
//      getDataFromSharedPreference().then(updateTitle);
//      super.initState();
//    }
//
//    return ListTile(
//      title: Text(
//        movie['title'],
////      movieTitle,
//      ),
//      trailing: Icon(
//        alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : null,
//      ),
//      onTap: () {
//        setState(() {
//          if (alreadySaved) {
//            _saved.remove(movie);
//            _counter = _counter - 1;
//          } else {
//            _saved.add(movie);
//            _counter = _counter + 1;
//          }
//        });
//      },
//    );
//  }
//
//  void updateTitle(String title) {
//    setState(() {
//      this.movieTitle = title;
//    });
//  }
//
//  void _pushSaved() {
//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          final Iterable<ListTile> tiles = _saved.map(
//            (movie) {
//              return ListTile(
//                title: Text(
//                  movie['title'],
//                ),
//              );
//            },
//          );
//          final List<Widget> divided = ListTile.divideTiles(
//            context: context,
//            tiles: tiles,
//          ).toList();
//
//          return Scaffold(
//            // Add 6 lines from here...
//            appBar: AppBar(
//              title: Text('Saved Suggestions'),
//            ),
//            body: ListView(children: divided),
//          ); // ... to here.
//        },
//      ),
//    );
//  }
//
//  Future<bool> saveInSharedPreference(String movieTitle) async {
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    preferences.setString("title", movieTitle);
//    return preferences.commit();
//  }
//
//  Future<String> getDataFromSharedPreference() async {
//    String movieTitle;
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    movieTitle = preferences.getString("title");
////    print("******************"+movieTitle+"******************");
//    return movieTitle;
//  }
//}
