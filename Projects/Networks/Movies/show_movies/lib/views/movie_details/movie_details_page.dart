import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:show_movies/views/book_tickets/book_tickets_page.dart';
import 'package:show_movies/views/home/home_page.dart';
import 'package:show_movies/views/cast_details/cast_details_page_sliver.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    Key key,
    this.currentMovie,
    this.index,
  }) : super(key: key);
  final Movie currentMovie;

  final int index;

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final List<MovieGenre> genreLists = genreParsed.results.toList();
  List<RectangularBox> genreGenerate() {
    final List<RectangularBox> results = <RectangularBox>[];
    for (final int iter in widget.currentMovie.genreIds) {
      final MovieGenre currentGenre =
          genreLists.firstWhere((MovieGenre element) => element.id == iter);
      results.add(
        RectangularBox(
          content: currentGenre.name,
          color: Colors.grey,
          size: 10.0,
        ),
      );
    }
    return results;
  }

  int index;
  // final List<String> items = <String>['1', '2', '3', '4'];
  // String selectedItem = '1';
  // Future<MovieCastResults> castResults;

  @override
  void initState() {
    super.initState();
    // castResults = fetchCastDetails(http.Client(), widget.currentMovie.id);
    //print(castResults);
  }

  @override
  Widget build(BuildContext context) {
    index = widget.index.toInt();
    //print(widget.currentMovie);
    return Scaffold(
      //  extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: InkWell(
              onTap: () {
                //var valuesDropDown =
                return showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return TicketFareDetails(
                      movieTitle: widget.currentMovie.originalTitle,
                    );
                  },
                );
                /*   return Scaffold.of(context).showBottomSheet(
                  (BuildContext context) {
                    return TicketFareDetails(
                      movieTitle: widget.currentMovie.originalTitle,
                    );
                  },
                );*/
                //print(valuesDropDown);
              },
              child: const Text(
                'BOOK-TICKET',
                style: TextStyle(
                  fontSize: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromRGBO(49, 49, 61, 0.7),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Stack(
                  children: <Widget>[
                    MovieCarouselSlider(
                      backDropPath: widget.currentMovie.backDropPath.toString(),
                      posterPath: widget.currentMovie.posterPath.toString(),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.35,
                    //   //color: Colors.blue,
                    //   child: Image.network(
                    //     imageSource +
                    //         widget.currentMovie.backDropPath.toString(),
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.14,
                            //color: Colors.green,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    RectangularBox(
                                      content: widget.currentMovie.releaseDate
                                          .substring(0, 4)
                                          .toString(),
                                      color: Colors.orange,
                                    ),
                                    RectangularBox(
                                      content: widget.currentMovie.voteAverage
                                          .toString(),
                                      color: Colors.orange,
                                    )
                                  ],
                                ),
                                Text(
                                  widget.currentMovie.originalTitle,
                                  style: const TextStyle(
                                    fontSize: 25.0,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Row(
                                    children: genreGenerate(),
                                  ),
                                ),
                              ],
                            ),
                            //color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                //   color: Colors.yellow,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(
                        10.0,
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      //color: Colors.green,
                      child: Hero(
                        tag: 'poster$index',
                        child: Image.network(
                          imageSource +
                              widget.currentMovie.posterPath.toString(),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      margin: const EdgeInsets.all(
                        10.0,
                      ),
                      //color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'SYNOPSIS',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.currentMovie.overview,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            softWrap: true,
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Cast',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      margin: const EdgeInsets.only(top: 5.0),
                      //color: Colors.red,
                      child: FutureBuilder<MovieCastResults>(
                        future: fetchCastDetails(
                          widget.currentMovie.id,
                        ),
                        builder: (BuildContext context,
                            AsyncSnapshot<MovieCastResults> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                          }

                          return snapshot.hasData
                              ? MovieCastList(
                                  movieCasts: snapshot.data.castResults)
                              : const Center(
                                  child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ],
                ),
                //color: Colors.green,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                //color: Colors.blue,
                padding: const EdgeInsets.only(
                  left: 15.0,
                  top: 5.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      margin: const EdgeInsets.only(top: 10.0),
                      //color: Colors.red,
                      child: FutureBuilder<MovieDetails>(
                        future: fetchMovieDetails(
                          widget.currentMovie.id,
                        ),
                        builder: (BuildContext context,
                            AsyncSnapshot<MovieDetails> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                          }

                          return snapshot.hasData
                              ? MovieDetailsDisplay(movieDetails: snapshot.data)
                              : const Center(
                                  child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 5.0,
                      ),
                      child: const Text(
                        'Similar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FutureBuilder<MovieResults>(
                      future: fetchSimilarMovies(widget.currentMovie.id),
                      builder: (BuildContext context,
                          AsyncSnapshot<MovieResults> snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }

                        return snapshot.hasData
                            ? MoviesListCustom(
                                movies: snapshot.data.results.toList())
                            : const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            status,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}

class RectangularBox extends StatelessWidget {
  const RectangularBox({
    Key key,
    this.content,
    this.color,
    this.size = 15.0,
  }) : super(key: key);

  final String content;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
        ),
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
          //    print(imageSource + iter.profilePath.toString());
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
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  fit: StackFit.loose,
                  //clipBehavior: Clip.hardEdge,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.network(
                        imageSource + iter.profilePath.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: 0,
                      child: Container(
                        //color: Colors.blue,
                        height: MediaQuery.of(context).size.height * 0.18,
                        padding: const EdgeInsets.only(
                          left: 5.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              //padding: EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                iter.originalName,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
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
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    child: Text(
                                      iter.character,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
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
    //print(convertedCurrencyAmount);
    return '\$$convertedCurrencyAmount';
  }

  String dateConverter(String dateString) {
    // final String rawDate = dateString;
    final DateTime parsedDate = DateTime.parse(dateString);
    final String requiredFormat = dateFormatter.format(parsedDate);
    //print(requiredFormat);
    //print(parsedDate);
    return requiredFormat.toString();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        // forceSafariVC: true,
        //forceWebView: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget genreGenerateAboutSection(List<MovieGenre> type) {
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
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(movieDetails);
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Original Title:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Status:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Runtime:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Type:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Premiere:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Budget:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Revenue:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Homepage:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(
              'Imdb:',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        //Column(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movieDetails.originalTitle,
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Text(
              movieDetails.status,
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Text(
              //movieDetails.runtime.toString(),
              runTimeConversion(movieDetails.runtime.toString()),
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            genreGenerateAboutSection(movieDetails.type.toList()),
            /* Text(
              //"Genre",
              movieDetails.type.toString(),
              style: TextStyle(color: Colors.white),
            ),*/
            const Spacer(),
            Text(
              //movieDetails.premiere,
              dateConverter(movieDetails.premiere),
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Text(
              // "\$${movieDetails.budget.toString()}",
              currencyAmountFormatter(movieDetails.budget.toString()),
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Text(
              //"\$${movieDetails.revenue.toString()}",
              currencyAmountFormatter(movieDetails.revenue.toString()),
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            InkWell(
              onTap: () => _launchURL(movieDetails.homepage),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  movieDetails.homepage,
                  style: const TextStyle(color: Colors.blue),
                  // softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              child: Text(
                'https://www.imdb.com/title/${movieDetails.imdbId}',
                style: const TextStyle(color: Colors.blue),
              ),
              onTap: () => _launchURL(
                  'https://www.imdb.com/title/${movieDetails.imdbId}'),
            ),
            /*Text(
              "https://www.imdb.com/title/${movieDetails.imdbId}",
              style: TextStyle(color: Colors.blue),
            ),*/
            const Spacer(),
          ],
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}

class MoviesListCustom extends StatelessWidget {
  const MoviesListCustom({Key key, this.movies}) : super(key: key);

  final List<Movie> movies;

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
                bottom: 15.0,
                right: 5.0,
                left: 5.0,
              ),
              child: Image.network(
                imageSource + movies[index].posterPath.toString(),
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
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'How many seats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
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
                        style: const TextStyle(
                          color: Colors.white,
                        ),
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
                //print("pressed");
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
              child: const Text(
                'Select Seats',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCarouselSlider extends StatelessWidget {
  const MovieCarouselSlider({
    Key key,
    this.backDropPath,
    this.posterPath,
  }) : super(key: key);
  final String backDropPath;

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          //color: Colors.blue,
          child: Image.network(
            imageSource + backDropPath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          //color: Colors.blue,
          child: Image.network(
            imageSource + backDropPath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          //color: Colors.blue,
          child: Image.network(
            imageSource + backDropPath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          //color: Colors.blue,
          child: Image.network(
            imageSource + backDropPath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          //color: Colors.blue,
          child: Image.network(
            imageSource + backDropPath,
            fit: BoxFit.fill,
          ),
        ),
      ],
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.35,
        enlargeCenterPage: false,
        //pageSnapping: false,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
    );
  }
}
