import 'dart:async';
// import 'package:carousel_slider/utils.dart';
import 'package:flutter/material.dart';
import 'package:show_movies/views/cast_details/cast_details_page_sliver.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:built_collection/built_collection.dart';
import 'package:show_movies/views/book_tickets/book_tickets_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
//import 'package:show_movies/views/movie_details/movie_details_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Container(
        color: Colors.black,
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
            const CustomDrawerTile(
              icon: Icons.movie,
              message: 'Movies',
            ),
            const CustomDrawerTile(
              icon: Icons.live_tv,
              message: 'TV Shows',
            ),
            const CustomDrawerTile(
              icon: Icons.event_seat,
              message: 'Discover',
            ),
            const CustomDrawerTile(
              icon: Icons.person,
              message: 'Popular People',
            ),
            const DrawerDivider(),
            const CustomDrawerTile(
              icon: Icons.alarm,
              message: 'Reminders',
            ),
            const DrawerDivider(),
            const CustomDrawerTile(
              icon: Icons.help,
              message: 'Contact Developer',
            ),
            const CustomDrawerTile(
              icon: Icons.help,
              message: 'Google+ Community',
            ),
            const CustomDrawerTile(
              icon: Icons.lock_open,
              message: 'Unlock Pro',
            ),
            const CustomDrawerTile(
              icon: Icons.settings,
              message: 'Settings',
            ),
          ].map((Widget child) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: child,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomDrawerTile extends StatelessWidget {
  const CustomDrawerTile({
    Key key,
    this.icon,
    this.message,
  }) : super(key: key);
  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        color: Colors.deepPurple,
        size: 30,
      ),
      title: Text(
        message,
        style: Theme.of(context).textTheme.headline2,
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
      color: Colors.blue,
    );
  }
}

class GenreChipsGenerate extends StatelessWidget {
  const GenreChipsGenerate({
    Key key,
    this.genreIds,
    this.genreLists,
  }) : super(key: key);
  final BuiltList<int> genreIds;
  final BuiltList<MovieGenre> genreLists;

  List<Widget> genreGenerate() {
    // print(genreLists.length);
    final List<Widget> results = <Widget>[];
    for (final int iter in genreIds) {
      final MovieGenre currentGenre =
          genreLists.firstWhere((MovieGenre element) => element.id == iter);
      results.add(
        Chip(
          label: Text(
            currentGenre.name.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey,
        ),
      );
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 2.0,
            children: genreGenerate(),
          ),
        ),
      ],
    );
  }
}

class TicketFare extends StatelessWidget {
  const TicketFare({
    Key key,
    this.seat,
    this.price,
    this.status,
  }) : super(key: key);
  final String seat, price, status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        10.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            seat,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            price,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            status,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}

class MovieCastList extends StatelessWidget {
  const MovieCastList({Key key, this.movieCasts}) : super(key: key);

  final BuiltList<MovieCast> movieCasts;

  @override
  Widget build(BuildContext context) {
    List<Widget> castImagesList() {
      final List<Widget> results = <Widget>[];
      for (final MovieCast iter in movieCasts) {
        if (iter.profilePath.toString() != 'null') {
          results.add(
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CastDetailsPageSliver(
                      id: iter.id,
                      profilePath: iter.profilePath,
                      name: iter.originalName,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.network(
                        NetworkApiRoutes.imageSource +
                            iter.profilePath.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        padding: const EdgeInsets.only(
                          left: 4.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                iter.originalName,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.person,
                                    color: Colors.orange,
                                    size: 18.0,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    child: Text(
                                      iter.character,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
      return results;
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: castImagesList(),
    );
  }
}

class MovieDetailsDisplay extends StatelessWidget {
  MovieDetailsDisplay({Key key, this.movieDetails}) : super(key: key);

  final MovieDetails movieDetails;

  String runTimeConversion(String runTime) {
    int minutes = int.parse(runTime);
    int hours = 0;
    if (minutes < 60) {
      return '$minutes m';
    } else if (minutes == 60) {
      return '1 h';
    } else {
      hours = minutes ~/ 60;
      minutes = minutes - (hours * 60);
      if (minutes == 0) {
        return '$hours h';
      } else {
        return '$hours h $minutes m';
      }
    }
  }

  final NumberFormat currencyConverter = NumberFormat('#,##0.00', 'en_US');

  final DateFormat dateFormatter = DateFormat.yMMMMd('en_US');

  String currencyAmountFormatter(String amount) {
    final double parsedAmount = double.parse(amount);
    final String convertedCurrencyAmount =
        currencyConverter.format(parsedAmount);
    return '\$$convertedCurrencyAmount';
  }

  String dateConverter(String dateString) {
    final DateTime parsedDate = DateTime.parse(dateString);
    final String requiredFormat = dateFormatter.format(parsedDate);
    return requiredFormat.toString();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget genreGenerateAboutSection(
      BuiltList<MovieGenre> type, BuildContext context) {
    String genreResult = '';
    final int length = type.length - 1;
    int counter = 0;
    for (final MovieGenre iter in type) {
      if (counter < length) {
        genreResult = genreResult + iter.name.toString() + ', ';
        counter++;
      } else {
        genreResult = genreResult + iter.name.toString();
      }
    }

    return Text(
      genreResult,
      style: Theme.of(context).textTheme.subtitle2,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Original Title:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  movieDetails.originalTitle,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Status:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  movieDetails.status,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Runtime:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  runTimeConversion(movieDetails.runtime.toString()),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Type:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: genreGenerateAboutSection(
                  movieDetails.type,
                  context,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Premiere:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  dateConverter(movieDetails.premiere),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Budget:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  currencyAmountFormatter(movieDetails.budget.toString()),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Revenue:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  currencyAmountFormatter(movieDetails.revenue.toString()),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Homepage:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () => _launchURL(movieDetails.homepage),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      movieDetails.homepage,
                      style: Theme.of(context).textTheme.headline4,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Imdb:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Text(
                    'https://www.imdb.com/title/${movieDetails.imdbId}',
                    style: Theme.of(context).textTheme.headline4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _launchURL(
                      'https://www.imdb.com/title/${movieDetails.imdbId}'),
                ),
              ),
            ],
          ),
        ]
            .map((Widget e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

class MoviesListCustom extends StatelessWidget {
  const MoviesListCustom({Key key, this.movies}) : super(key: key);

  final BuiltList<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(
                bottom: 14.0,
                right: 4.0,
                left: 4.0,
              ),
              child: Image.network(
                NetworkApiRoutes.imageSource +
                    movies[index].posterPath.toString(),
                fit: BoxFit.fill,
              ),
            );
          }),
    );
  }
}

class TicketFareDetails extends StatefulWidget {
  const TicketFareDetails({Key key, this.movieTitle}) : super(key: key);
  final String movieTitle;

  @override
  _TicketFareDetailsState createState() => _TicketFareDetailsState();
}

class _TicketFareDetailsState extends State<TicketFareDetails> {
  final List<String> items = <String>['1', '2', '3', '4'];
  String selectedItem = '1';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: Theme.of(context).accentIconTheme.size,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  'How many seats',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const Spacer(
                  flex: 4,
                ),
                DropdownButton<String>(
                  value: selectedItem,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  onChanged: (String string) =>
                      setState(() => selectedItem = string),
                  selectedItemBuilder: (BuildContext context) {
                    return items.map<Widget>((String item) {
                      return Text(
                        item,
                        style: Theme.of(context).textTheme.bodyText2,
                      );
                    }).toList();
                  },
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      value: item,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const DrawerDivider(),
          Row(
            children: const <Widget>[
              Spacer(),
              TicketFare(
                seat: 'Balcony',
                price: '₹150.0',
                status: 'Available',
              ),
              TicketFare(
                seat: 'First-Class',
                price: '₹120.0',
                status: 'Available',
              ),
              Spacer(),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => BookTicketsPage(
                      seatCounts: int.parse(selectedItem),
                      movieTitle: widget.movieTitle,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // background
                onPrimary: Colors.white, // foreground
              ),
              child: Text(
                'Select Seats',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCreditsDisplay extends StatelessWidget {
  MovieCreditsDisplay({Key key, this.movieCredits}) : super(key: key);

  final BuiltList<MovieCredits> movieCredits;

  final BuiltList<MovieGenre> genreLists = Singleton().genreParsed.results;

  Widget genreGenerate(List<int> genreIds, BuildContext context) {
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
      style: Theme.of(context).textTheme.headline3,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imagesList() {
      final List<Widget> results = <Widget>[];
      for (final MovieCredits iter in movieCredits) {
        if (iter.posterPath.toString() != 'null' &&
            iter.releaseDate.toString().length > 4) {
          results.add(
            Container(
              padding: const EdgeInsets.all(
                4.0,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Image.network(
                      NetworkApiRoutes.imageSource + iter.posterPath.toString(),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Colors.black.withOpacity(0.3),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  iter.originalTitle,
                                  style: Theme.of(context).textTheme.headline3,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                iter.voteAverage.toString(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 4.0),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child:
                                    genreGenerate(iter.genre.toList(), context),
                              ),
                              const Spacer(),
                              Text(
                                iter.releaseDate.substring(0, 4),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 4.0),
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
            ),
          );
        }
      }
      return results;
    }

    return ListView(
      children: imagesList(),
    );
  }
}

class TvCreditsDisplay extends StatelessWidget {
  TvCreditsDisplay({Key key, this.tvCredits}) : super(key: key);

  final BuiltList<TvCredits> tvCredits;

  final BuiltList<MovieGenre> genreLists = Singleton().genreParsed.results;

  Widget genreGenerate(List<int> genreIds, BuildContext context) {
    final MovieGenre tv = genreLists[0];
    String genreResult = '';
    final int length = genreIds.length - 1;
    int counter = 0;
    for (final int iter in genreIds) {
      final MovieGenre currentGenre = genreLists
          .firstWhere((MovieGenre element) => element.id == iter, orElse: () {
        return tv.rebuild((MovieGenreBuilder b) => b.name = 'TV');
      });

      if (counter < length) {
        genreResult = genreResult + currentGenre.name.toString() + ', ';
        counter++;
      } else {
        genreResult = genreResult + currentGenre.name.toString();
      }
    }

    return Text(
      genreResult,
      style: Theme.of(context).textTheme.headline3,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imagesList() {
      final List<Widget> results = <Widget>[];
      for (final TvCredits iter in tvCredits) {
        if (iter.posterPath.toString() != 'null' &&
            iter.firstAirDate.toString().length > 4 &&
            iter.genreIds != null) {
          results.add(
            Container(
              padding: const EdgeInsets.all(
                4.0,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Image.network(
                      NetworkApiRoutes.imageSource + iter.posterPath.toString(),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Colors.black.withOpacity(0.3),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  iter.originalName,
                                  style: Theme.of(context).textTheme.headline3,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                iter.voteAverage.toString(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 4.0),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: genreGenerate(
                                  iter.genreIds.toList(),
                                  context,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                iter.firstAirDate.substring(0, 4),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 4.0),
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
            ),
          );
        }
      }
      return results;
    }

    return ListView(
      children: imagesList(),
    );
  }
}
