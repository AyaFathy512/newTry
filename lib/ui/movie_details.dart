import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class MovieDetailsScreen extends StatelessWidget {

  final String text;
  final String rate;
  final String year;
  final String image;
  MovieDetailsScreen({Key key, @required this.text, @required this.rate,
    @required this.year, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        // title: Text('Movie Details'),
        backgroundColor: Color(0xfff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              heightFactor: 500,
              widthFactor: 450,
              child: Image.network(
                image,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
//              movie.title,
            text,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              rate,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              year,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            SmoothStarRating(
                allowHalfRating: false,
                onRatingChanged: (v) {
                  var rating = v;
                  setState(() {});
                },
                starCount: 5,
                rating: 4,
                size: 40.0,
                filledIconData: Icons.blur_off,
                halfFilledIconData: Icons.blur_on,
                color: Colors.green,
                borderColor: Colors.green,
                spacing:0.0
            )

          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}