import 'package:flutterday2movies/data_access_layer/model/moviemodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpClient {
  Future<dynamic> get(String url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      return Future.error(Error());
    }
  }
}
