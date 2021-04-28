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

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    Singleton().genreMapGenerator();
    _controller.addListener(() {
      setState(() {
        //  _selectedIndex = _controller.index;
      });
    });
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
            FutureBuilder<MovieResults>(
              future: NetworkApiRoutes.fetchPopularMovies(http.Client()),
              builder:
                  (BuildContext context, AsyncSnapshot<MovieResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? MoviesList(
                        movies: snapshot.data.results,
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<MovieResults>(
              future: NetworkApiRoutes.fetchTopRatedMovies(http.Client()),
              builder:
                  (BuildContext context, AsyncSnapshot<MovieResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? MoviesList(
                        movies: snapshot.data.results,
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<MovieResults>(
              future: NetworkApiRoutes.fetchUpcomingMovies(http.Client()),
              builder:
                  (BuildContext context, AsyncSnapshot<MovieResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? MoviesList(
                        movies: snapshot.data.results,
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
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
      child: FadeTransition(
        opacity: animation,
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
                    child: Image.network(
                      NetworkApiRoutes.imageSource +
                          widget.movies[index].posterPath.toString(),
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
      ),
    );
  }
}
