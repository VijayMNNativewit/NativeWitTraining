import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:show_movies/views/book_tickets/book_tickets_page.dart';
import 'package:show_movies/views/home/home_page.dart';

class CastDetailsPageSliver extends StatefulWidget {
  final String name;
  final String profilePath;
  final int id;
  CastDetailsPageSliver({
    Key key,
    this.name,
    this.profilePath,
    this.id,
  }) : super(key: key);

  @override
  _CastDetailsPageSliverState createState() => _CastDetailsPageSliverState();
}

class _CastDetailsPageSliverState extends State<CastDetailsPageSliver>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    //print(widget.name);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 200.0,
                //snap: true,
                floating: true,
                pinned: true,
                flexibleSpace: Container(
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight,
                  //     colors: [
                  //       Colors.blue,
                  //       Colors.deepPurpleAccent,
                  //     ],
                  //   ),
                  // ),
                  child: FlexibleSpaceBar(
                    background: Container(
                      child: Container(
                        padding: EdgeInsets.all(50.0),
                        child: CircleAvatar(
                          radius: 500,
                          backgroundImage: NetworkImage(
                            imageSource + widget.profilePath,
                            //scale: 0.5,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.blue,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                      ),
                    ),
                    centerTitle: true,
                    title: Container(
                      child: Text(widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.greenAccent,
                    controller: _controller,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.movie,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.tv,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          // appBar: AppBar(
          //   leading: IconButton(
          //     icon: Icon(
          //       Icons.arrow_back,
          //       size: 28,
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          //   backgroundColor: Colors.transparent,
          //   bottom: TabBar(
          //     indicatorColor: Colors.greenAccent,
          //     //labelColor: Colors.white,
          //     controller: _controller,
          //     tabs: [
          //       Tab(
          //         icon: Icon(
          //           Icons.movie,
          //           color: Colors.white,
          //           size: 25.0,
          //         ),
          //       ),
          //       Tab(
          //         icon: Icon(
          //           Icons.tv,
          //           color: Colors.white,
          //           size: 25.0,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          body: TabBarView(
            controller: _controller,
            children: [
              Container(
                //padding: EdgeInsets.only(top: 15.0),
                child: FutureBuilder<MovieCreditsResults>(
                  future: fetchMovieCredits(widget.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? MovieCreditsDisplay(
                            movieCredits:
                                snapshot.data.movieCreditsResults.toList())
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Container(
                child: FutureBuilder<TvCreditsResults>(
                  future: fetchTvCredits(widget.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? TvCreditsDisplay(
                            tvCredits: snapshot.data.tvCreditsResults.toList())
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCreditsDisplay extends StatelessWidget {
  final List<MovieCredits> movieCredits;

  MovieCreditsDisplay({Key key, this.movieCredits}) : super(key: key);

  final List<MovieGenre> genreLists = genreParsed.results.toList();

  Widget genreGenerate(List<int> genreIds) {
    String genreResult = "";
    int length = genreIds.length - 1;
    int counter = 0;
    for (var iter in genreIds) {
      MovieGenre currentGenre =
          genreLists.firstWhere((element) => element.id == iter);

      if (counter < length) {
        genreResult = genreResult + currentGenre.name.toString() + ", ";
        counter++;
      } else {
        genreResult = genreResult + currentGenre.name.toString();
      }
    }

    return Text(
      genreResult,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(movieCredits);
    return Container(
      color: Color.fromRGBO(49, 49, 61, 0.7),
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //childAspectRatio: 0.5,
          //mainAxisSpacing: 10.0,
          //crossAxisSpacing: 10.0,
        ),
        itemCount: movieCredits.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(
              5.0,
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    imageSource + movieCredits[index].posterPath.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.3),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                movieCredits[index].originalTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                movieCredits[index].voteAverage.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0),
                          ),
                          Row(
                            children: [
                              genreGenerate(movieCredits[index].genre.toList()),
                              /* Text(
                                movieCredits[index].genre.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),*/
                              Spacer(),
                              Text(
                                movieCredits[index].releaseDate.substring(0, 4),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TvCreditsDisplay extends StatelessWidget {
  final List<TvCredits> tvCredits;

  TvCreditsDisplay({Key key, this.tvCredits}) : super(key: key);

  final List<MovieGenre> genreLists = genreParsed.results.toList();

  Widget genreGenerate(List<int> genreIds) {
    String genreResult = "";
    int length = genreIds.length - 1;
    int counter = 0;
    for (var iter in genreIds) {
      MovieGenre currentGenre =
          genreLists.firstWhere((element) => element.id == iter);

      if (counter < length) {
        genreResult = genreResult + currentGenre.name.toString() + ", ";
        counter++;
      } else {
        genreResult = genreResult + currentGenre.name.toString();
      }
    }

    return Text(
      genreResult,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(tvCredits);
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      color: Color.fromRGBO(49, 49, 61, 0.7),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //childAspectRatio: 0.5,
          //mainAxisSpacing: 10.0,
          //crossAxisSpacing: 10.0,
        ),
        itemCount: tvCredits.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(
              5.0,
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    imageSource + tvCredits[index].posterPath.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.3),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                tvCredits[index].originalName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                tvCredits[index].voteAverage.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0),
                          ),
                          Row(
                            children: [
                              genreGenerate(tvCredits[index].genreIds.toList()),
                              // Text(
                              //   tvCredits[index].genreIds.toString(),
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 15,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              Spacer(),
                              Text(
                                tvCredits[index].firstAirDate.substring(0, 4),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue,
            Colors.deepPurpleAccent,
          ],
        ),
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
