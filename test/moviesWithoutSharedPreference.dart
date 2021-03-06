import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Set _saved = Set();
  final String url = "https://api.androidhive.info/json/movies.json";
  List movies;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      movies = convertDataToJson;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        itemCount: movies == null ? 0 : movies.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(movies[index]);
        },
      ),
    );
  }

  Widget _buildRow(movie) {
    final alreadySaved = _saved.contains(movie);

    return ListTile(
      title: Text(
        movie['title'],
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(movie);
            _counter = _counter - 1;
          } else {
            _saved.add(movie);
            _counter = _counter + 1;
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (movie) {
              return ListTile(
                title: Text(
                  movie['title'],
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
}
