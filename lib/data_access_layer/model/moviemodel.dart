class Movie{
  String title;
  String image;
  double rating;
  int releaseYear;
  List<String> genre;

  Movie({this.title,this.image,this.rating,this.releaseYear,this.genre});
//  Movie(this.title,this.image,this.rating);
//  Movie(this.title,this.image);

  factory Movie.formJson(Map<String, dynamic> json) => Movie(
      title: json["title"],
      image: json["image"],
      rating: json["rating"].toDouble(),
      releaseYear: json["releaseYear"],
      genre: List<String>.from(json["genre"].map((x)=>x)),
    );

}