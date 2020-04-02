import 'package:flutter/material.dart';
import 'screens/Result.dart';
import 'screens/Search.dart';

void main() => runApp(ParsesApp());

class ParsesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parses Sample',
      home: Search() ,
       routes: <String, WidgetBuilder>{
          'Search': (BuildContext context) => new Search(),
          'Result': (BuildContext context) => new Result(),
       }
    );
  }
}