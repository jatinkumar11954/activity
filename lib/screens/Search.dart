import 'package:flutter/material.dart';
import 'package:moviesapp/components/MovieList.dart';
import 'package:moviesapp/models/MovieInfo.dart';
import 'package:moviesapp/screens/Result.dart';
import 'package:moviesapp/services/MovieService.dart';
import 'package:moviesapp/models/Movie.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as hp;
import 'dart:convert';


class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
 MovieInfo snap;
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Movie item)  async {
  final response = await hp.get('http://www.omdbapi.com/?apikey=a1b5f9ec&i=${item.imdbID}');

  if (response.statusCode == 200) {
    Map data = json.decode(response.body);

    if (data['Response'] == "True") {
       snap=MovieInfo.fromJSON(data);
       
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('There is a problem');
  }

    Navigator.pushNamed(
      context,
     "Result",arguments:snap
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Search Movies')),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: searchTextController,
                    decoration:
                        InputDecoration(hintText: 'Enter a search term'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Search Movies',
                  onPressed: () {
                    setState(() {
                      searchText = searchTextController.text;
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    });
                  },
                ),
              ]),
              padding: EdgeInsets.all(10),
            ),
            if (searchText.length > 0)
              FutureBuilder<List<Movie>>(
                  future: searchMovies(searchText),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: MovieList(
                              movies: snapshot.data,
                              itemClick: this.itemClick));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
          ],
        ));
  }
}
