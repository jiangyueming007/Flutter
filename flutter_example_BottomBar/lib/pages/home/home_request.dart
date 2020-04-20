
import 'package:demo1/model/home_model.dart';
import 'package:demo1/service/config.dart';
import 'package:demo1/service/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    final movieURL = "/movie/top250?start=$start&count=${HomeMovieCountConfig.count}";
     final response = await HttpRequest.get(movieURL);
     final subjects = response["subjects"];
     List<MovieItem> movies = [];
     for (var sub in subjects ){
       movies.add(MovieItem.fromMap(sub));
     }
     return movies;
  }
}