import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';

class CastDetailsPageSliver extends StatefulWidget {
  const CastDetailsPageSliver({
    Key key,
    this.name,
    this.profilePath,
    this.id,
  }) : super(key: key);
  final String name;
  final String profilePath;
  final int id;

  @override
  _CastDetailsPageSliverState createState() => _CastDetailsPageSliverState();
}

class _CastDetailsPageSliverState extends State<CastDetailsPageSliver>
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
        // _selectedIndex = _controller.index;
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
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Container(
                      padding: const EdgeInsets.all(50.0),
                      child: CircleAvatar(
                        radius: 500,
                        backgroundImage: NetworkImage(
                          imageSource + widget.profilePath,
                          //scale: 0.5,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.blue,
                          Colors.deepPurpleAccent,
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Text(widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.greenAccent,
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
      ),
    );
  }
}

class MovieCreditsDisplay extends StatelessWidget {
  MovieCreditsDisplay({Key key, this.movieCredits}) : super(key: key);

  final List<MovieCredits> movieCredits;

  final List<MovieGenre> genreLists = genreParsed.results.toList();

  Widget genreGenerate(List<int> genreIds) {
    String genreResult = '';
    final int length = genreIds.length - 1;
    int counter = 0;
    for (final int iter in genreIds) {
      final MovieGenre currentGenre =
          genreLists.firstWhere((MovieGenre element) => element.id == iter);

      if (counter < length) {
        genreResult = genreResult + currentGenre.name.toString() + ', ';
        counter++;
      } else {
        genreResult = genreResult + currentGenre.name.toString();
      }
    }

    return Text(
      genreResult,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

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
                            Container(
                              child: genreGenerate(
                                movieCredits[index].genre.toList(),
                              ),
                            ),
                            /* Text(
                              movieCredits[index].genre.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),*/
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
  TvCreditsDisplay({Key key, this.tvCredits}) : super(key: key);

  final List<TvCredits> tvCredits;

  final List<MovieGenre> genreLists = genreParsed.results.toList();

  Widget genreGenerate(List<int> genreIds) {
    String genreResult = '';
    final int length = genreIds.length - 1;
    int counter = 0;
    for (final int iter in genreIds) {
      final MovieGenre currentGenre =
          genreLists.firstWhere((MovieGenre element) => element.id == iter);

      if (counter < length) {
        genreResult = genreResult + currentGenre.name.toString() + ', ';
        counter++;
      } else {
        genreResult = genreResult + currentGenre.name.toString();
      }
    }

    return Text(
      genreResult,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(tvCredits);
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
                            Container(
                              child: genreGenerate(
                                tvCredits[index].genreIds.toList(),
                              ),
                            ),
                            // Text(
                            //   tvCredits[index].genreIds.toString(),
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 15,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
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
