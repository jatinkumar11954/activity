import 'package:flutter/material.dart';
import 'package:moviesapp/services/MovieService.dart';
import 'package:moviesapp/models/MovieInfo.dart';


class Result extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      final MovieInfo snap = ModalRoute.of(context).settings.arguments ; 
    return Scaffold(
     
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
               snap.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.end,
              ),
              background: Hero(
                tag: snap.poster,
                child: Image.network(
                  snap.poster,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                DataTable(
                          headingRowHeight:
                              MediaQuery.of(context).size.height * 0.0,
                          horizontalMargin:
                              MediaQuery.of(context).size.width * 0.03,
                          columnSpacing:
                              MediaQuery.of(context).size.width * 0.04,
                          sortAscending: true,
                          columns: <DataColumn>[
                            DataColumn(
                              numeric: false,
                              
                              label: Text(""),
                            ),
                            DataColumn(
                              label: Text(""),
                              numeric: false,
                             
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(
                                  Text("Title",
                                      style: TextStyle(
                                            fontFamily: "CharterBT",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                             (MediaQuery.of(context).size.height  *0.025
                                      )),),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text(snap.title,
                                      style: TextStyle(
                                            fontFamily: "CharterBT",
                                        color: Colors.pink,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (MediaQuery.of(context).size.height ) *0.025,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                              ],
                            ),
                            DataRow(
                              //for the data of session 1 in gold
                              cells: [
                                DataCell(
                                  Text("Released",
                                      style: TextStyle(
                                            fontFamily: "CharterBT",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (MediaQuery.of(context).size.height ) *0.025,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ), DataCell(
                                  Text(snap.released,
                                      style: TextStyle(
                                            fontFamily: "CharterBT",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (MediaQuery.of(context).size.height ) *0.025,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),]),
                                DataRow(
                              //for the data of session 1 in gold
                              cells: [
                                DataCell(
                                  Text("Runtime",
                                      style: TextStyle(
                                            fontFamily: "CharterBT",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (MediaQuery.of(context).size.height ) *0.025,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ), DataCell(
                                  Text(snap.runtime,
                                      style: TextStyle(
                                            fontFamily: "CharterBT",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            (MediaQuery.of(context).size.height ) *0.025,
                                      )),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),]),
              ],)

                 
               
               
              ],
            ),
          ),
        ],
      ),

    );
  }
}
