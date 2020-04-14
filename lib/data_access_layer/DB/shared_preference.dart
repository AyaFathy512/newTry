import 'package:shared_preferences/shared_preferences.dart';

class DataBase{
  Future<bool> saveInSharedPreference(String movieTitle) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("title", movieTitle);
    return preferences.commit();
  }

  Future<String> getDataFromSharedPreference() async {
    String movieTitle;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    movieTitle = preferences.getString("title");
//    print("******************"+movieTitle+"******************");
    return movieTitle;
  }
}