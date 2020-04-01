import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesapp/models/Movie.dart';
import 'package:moviesapp/models/MovieInfo.dart';



Future<List<Movie>> searchMovies(keyword) async {
  final response = await http.get('http://www.omdbapi.com/?apikey=a1b5f9ec&s=$keyword');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
     return (data['Search'] as List)
          .map((item) => new Movie.fromJson(item))
          .toList();
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}


