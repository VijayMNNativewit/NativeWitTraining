import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:show_movies/views/movie_details/movie_details_page.dart';
import 'package:show_movies/utils/custom_widgets.dart';
import 'package:built_collection/built_collection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;

  //int _selectedIndex = 0;
  BuiltList<Movie> popularMoviesList = <Movie>[].toBuiltList();
  BuiltList<Movie> topRatedMoviesList = <Movie>[].toBuiltList();
  BuiltList<Movie> upcomingMoviesList = <Movie>[].toBuiltList();

  int popularMoviesPage = 1, topRatedMoviesPage = 1, upcomingMoviesPage = 1;
  bool loading = false;
  bool topRatedLoading = false, upcomingLoading = false;

  @override
  void initState() {
    super.initState();
    _future = _getFuture();
    _topRatedFuture = _getTopRatedFuture();
    _upcomingFuture = _getUpcomingFuture();
    _controller = TabController(length: 3, vsync: this);

    Singleton().genreMapGenerator();
    _controller.addListener(() {
      setState(() {
        //  _selectedIndex = _controller.index;
      });
    });
  }

  void _reloadData() {
    if (!loading) {
      setState(() {
        _future = _getFuture();
      });
    }
  }

  void _reloadTopRatedData() {
    if (!topRatedLoading) {
      setState(() {
        _topRatedFuture = _getTopRatedFuture();
      });
    }
  }

  void _reloadUpcomingData() {
    if (!upcomingLoading) {
      setState(() {
        _upcomingFuture = _getUpcomingFuture();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          /*leading: Icon(
            Icons.menu,
            size: 30.0,
          ),*/
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: Theme.of(context).primaryIconTheme.size,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          title: Container(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Book Movie',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.all(
                10.0,
              ),
              child: Icon(
                Icons.search,
                size: Theme.of(context).primaryIconTheme.size,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: const <Widget>[
              Tab(
                text: 'POPULAR',
              ),
              Tab(
                text: 'TOP-RATED',
              ),
              Tab(
                text: 'UPCOMING',
              ),
            ],
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        drawer: const DrawerWidget(),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            FutureBuilder<void>(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error?.toString() ?? ''),
                  );
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification n) {
                    if (n is ScrollEndNotification) {
                      _reloadData();
                    }
                    return true;
                  },
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: MoviesList(
                          movies: popularMoviesList,
                        ),
                      ),
                      if (snapshot.connectionState != ConnectionState.done &&
                          false)
                        const CircularProgressIndicator(),
                    ],
                  ),
                );

                // return snapshot.hasData &&
                //         snapshot.connectionState == ConnectionState.done
                //     ? MoviesList(
                //         movies: snapshot.data.results,
                //       )
                //     : const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<void>(
              future: _topRatedFuture,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error?.toString() ?? ''),
                  );
                }

                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification n) {
                    if (n is ScrollEndNotification) {
                      _reloadTopRatedData();
                    }
                    return true;
                  },
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: MoviesList(
                          movies: topRatedMoviesList,
                        ),
                      ),
                      if (snapshot.connectionState != ConnectionState.done &&
                          false)
                        const CircularProgressIndicator(),
                    ],
                  ),
                );
                // return snapshot.hasData
                //     ? MoviesList(
                //         movies: snapshot.data.results,
                //       )
                //     : const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<void>(
              future: _upcomingFuture,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error?.toString() ?? ''),
                  );
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification n) {
                    if (n is ScrollEndNotification) {
                      _reloadUpcomingData();
                    }
                    return true;
                  },
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: MoviesList(
                          movies: upcomingMoviesList,
                        ),
                      ),
                      if (snapshot.connectionState != ConnectionState.done &&
                          false)
                        const CircularProgressIndicator(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _future;
  Future<void> _topRatedFuture;
  Future<void> _upcomingFuture;

  Future<void> _getFuture() async {
    loading = true;
    final MovieResults r = await NetworkApiRoutes.fetchPopularMovies(
      http.Client(),
      popularMoviesPage,
    );
    popularMoviesList = popularMoviesList.rebuild((ListBuilder<Movie> b) {
      b.addAll(r.results);
    });
    popularMoviesPage++;
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _getTopRatedFuture() async {
    topRatedLoading = true;
    final MovieResults r = await NetworkApiRoutes.fetchTopRatedMovies(
      http.Client(),
      topRatedMoviesPage,
    );
    topRatedMoviesList = topRatedMoviesList.rebuild((ListBuilder<Movie> b) {
      b.addAll(r.results);
    });
    topRatedMoviesPage++;
    if (mounted) {
      setState(() {
        topRatedLoading = false;
      });
    }
  }

  Future<void> _getUpcomingFuture() async {
    upcomingLoading = true;
    final MovieResults r = await NetworkApiRoutes.fetchUpcomingMovies(
      http.Client(),
      upcomingMoviesPage,
    );
    upcomingMoviesList = upcomingMoviesList.rebuild((ListBuilder<Movie> b) {
      b.addAll(r.results);
    });
    //print(upcomingMoviesList);
    upcomingMoviesPage++;
    if (mounted) {
      setState(() {
        upcomingLoading = false;
      });
    }
  }
}

class MoviesList extends StatefulWidget {
  const MoviesList({
    Key key,
    this.movies,
  }) : super(key: key);

  final BuiltList<Movie> movies;

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: widget.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => MovieDetailsPage(
                    currentMovie: widget.movies[index],
                    index: index,
                  ),
                ),
              );
            },
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'poster$index',
                  child: FadeTransition(
                    opacity: animation,
                    child: Image.network(
                      NetworkApiRoutes.imageSource +
                          widget.movies[index].posterPath.toString(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.movies[index].originalTitle.toString(),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
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
