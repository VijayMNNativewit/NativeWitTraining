import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:show_movies/views/movie_details/movie_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _controller;
  //int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    genreMapGenerator();
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
              icon: const Icon(
                Icons.menu,
                size: 30.0,
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
                const Text(
                  'Book Movie',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
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
              child: const Icon(
                Icons.search,
                size: 30.0,
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
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            color: const Color.fromRGBO(49, 49, 61, 0.7),
            child: ListView(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.blue,
                        Colors.deepPurpleAccent,
                      ],
                    ),
                  ),
                  child: null,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.movie,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.live_tv,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'TV Shows',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.event_seat,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Discover',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.person,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Popular People',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const DrawerDivider(),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.alarm,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Reminders',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const DrawerDivider(),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.help,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Contact Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.help,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Google+ Community',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.lock_open,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Unlock Pro',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ].map((Widget child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: child,
                );
              }).toList(),
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            FutureBuilder<MovieResults>(
              future: fetchPopularMovies(http.Client()),
              builder:
                  (BuildContext context, AsyncSnapshot<MovieResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? MoviesList(movies: snapshot.data.results.toList())
                    : const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<MovieResults>(
              future: fetchTopRatedMovies(http.Client()),
              builder:
                  (BuildContext context, AsyncSnapshot<MovieResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? MoviesList(movies: snapshot.data.results.toList())
                    : const Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<MovieResults>(
              future: fetchUpcomingMovies(http.Client()),
              builder:
                  (BuildContext context, AsyncSnapshot<MovieResults> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }

                return snapshot.hasData
                    ? MoviesList(movies: snapshot.data.results.toList())
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 4,
      thickness: 2,
      color: Colors.grey,
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({Key key, this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(49, 49, 61, 0.7),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
          //mainAxisSpacing: 10.0,
          //crossAxisSpacing: 10.0,
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //color: Color.fromRGBO(49, 49, 61, 0.7),
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => MovieDetailsPage(
                      currentMovie: movies[index],
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
                      imageSource + movies[index].posterPath.toString(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      movies[index].originalTitle.toString(),
                      //softWrap: false,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
