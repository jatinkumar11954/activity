import 'package:flutter/material.dart';
import 'package:moviesapp/screens/Result.dart';
import 'package:moviesapp/screens/Search.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Sample',
      home: Search() ,
       routes: <String, WidgetBuilder>{
          'Search': (BuildContext context) => new Search(),
          'Result': (BuildContext context) => new Result(),
       }
    );
  }
}