import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';

class CastDetailsPage extends StatefulWidget {
  const CastDetailsPage({
    Key key,
    this.name,
    this.profilePath,
    this.id,
  }) : super(key: key);
  final String name;
  final String profilePath;
  final int id;

  @override
  _CastDetailsPageState createState() => _CastDetailsPageState();
}

class _CastDetailsPageState extends State<CastDetailsPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  //int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    //print(widget.name);
    _controller.addListener(() {
      setState(() {
        //_selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            indicatorColor: Colors.greenAccent,
            //labelColor: Colors.white,
            controller: _controller,
            tabs: const <Widget>[
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
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            FutureBuilder<MovieCreditsResults>(
              future: fetchMovieCredits(widget.id),
              builder: (BuildContext context,
                  AsyncSnapshot<MovieCreditsResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? MovieCreditsDisplay(
                        movieCredits:
                            snapshot.data.movieCreditsResults.toList())
                    : const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<TvCreditsResults>(
              future: fetchTvCredits(widget.id),
              builder: (BuildContext context,
                  AsyncSnapshot<TvCreditsResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? TvCreditsDisplay(
                        tvCredits: snapshot.data.tvCreditsResults.toList())
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCreditsDisplay extends StatelessWidget {
  const MovieCreditsDisplay({Key key, this.movieCredits}) : super(key: key);

  final List<MovieCredits> movieCredits;

  @override
  Widget build(BuildContext context) {
    // print(movieCredits);
    return Container(
      color: const Color.fromRGBO(49, 49, 61, 0.7),
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //childAspectRatio: 0.5,
          //mainAxisSpacing: 10.0,
          //crossAxisSpacing: 10.0,
        ),
        itemCount: movieCredits.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(
              5.0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              movieCredits[index].originalTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              movieCredits[index].voteAverage.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              movieCredits[index].genre.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              movieCredits[index].releaseDate.substring(0, 4),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: const Icon(
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
              ],
            ),
          );
        },
      ),
    );
  }
}

class TvCreditsDisplay extends StatelessWidget {
  const TvCreditsDisplay({Key key, this.tvCredits}) : super(key: key);

  final List<TvCredits> tvCredits;

  @override
  Widget build(BuildContext context) {
    print(tvCredits);
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      color: const Color.fromRGBO(49, 49, 61, 0.7),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //childAspectRatio: 0.5,
          //mainAxisSpacing: 10.0,
          //crossAxisSpacing: 10.0,
        ),
        itemCount: tvCredits.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(
              5.0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              tvCredits[index].originalName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              tvCredits[index].voteAverage.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              tvCredits[index].genreIds.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              tvCredits[index].firstAirDate.substring(0, 4),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: const Icon(
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
              ],
            ),
          );
        },
      ),
    );
  }
}
