import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:show_movies/views/book_tickets/book_tickets_page.dart';
import 'package:show_movies/views/home/home_page.dart';
import 'package:show_movies/views/cast_details/cast_details_page.dart';
import 'package:show_movies/views/cast_details/cast_details_page_sliver.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie currentMovie;
  final int index;

  MovieDetailsPage({
    Key key,
    this.currentMovie,
    this.index,
  }) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final List<MovieGenre> genreLists = genreParsed.results.toList();
  List<RectangularBox> genreGenerate() {
    List<RectangularBox> results = [];
    for (var iter in widget.currentMovie.genreIds) {
      MovieGenre currentGenre =
          genreLists.firstWhere((element) => element.id == iter);
      results.add(
        RectangularBox(
          content: currentGenre.name,
          color: Colors.grey,
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
          icon: Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(
              10.0,
            ),
            child: InkWell(
              onTap: () {
                //var valuesDropDown =
                return showModalBottomSheet(
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
              child: Text(
                "BOOK-TICKET",
                style: TextStyle(
                  fontSize: 19.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(49, 49, 61, 0.7),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Stack(
                  children: [
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
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.14,
                            //color: Colors.green,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
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
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: genreGenerate(),
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
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                //   color: Colors.yellow,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(
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
                      margin: EdgeInsets.all(
                        10.0,
                      ),
                      //color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SYNOPSIS",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.currentMovie.overview,
                            style: TextStyle(
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
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cast",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      margin: EdgeInsets.only(top: 5.0),
                      //color: Colors.red,
                      child: Container(
                        child: FutureBuilder<MovieCastResults>(
                          future: fetchCastDetails(
                            widget.currentMovie.id,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? MovieCastList(
                                    movieCasts: snapshot.data.castResults)
                                : Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //color: Colors.green,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                //color: Colors.blue,
                padding: EdgeInsets.only(
                  left: 15.0,
                  top: 5.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      margin: EdgeInsets.only(top: 10.0),
                      //color: Colors.red,
                      child: Container(
                        child: FutureBuilder<MovieDetails>(
                          future: fetchMovieDetails(
                            widget.currentMovie.id,
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? MovieDetailsDisplay(
                                    movieDetails: snapshot.data)
                                : Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 15.0,
                        top: 5.0,
                      ),
                      child: Text(
                        "Similar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      child: FutureBuilder<MovieResults>(
                        future: fetchSimilarMovies(widget.currentMovie.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);

                          return snapshot.hasData
                              ? MoviesListCustom(
                                  movies: snapshot.data.results.toList())
                              : Center(child: CircularProgressIndicator());
                        },
                      ),
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
      padding: EdgeInsets.all(
        10.0,
      ),
      child: Column(
        children: [
          Text(
            seat,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            status,
            style: TextStyle(
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
  }) : super(key: key);

  final String content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class MovieCastList extends StatelessWidget {
  final BuiltList<MovieCast> movieCasts;

  MovieCastList({Key key, this.movieCasts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> castImagesList() {
      List<Widget> results = [];
      for (var iter in movieCasts) {
        if (iter.profilePath.toString() != "null") {
          //    print(imageSource + iter.profilePath.toString());
          results.add(
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CastDetailsPageSliver(
                      id: iter.id,
                      profilePath: iter.profilePath,
                      name: iter.originalName,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Stack(
                  fit: StackFit.loose,
                  //clipBehavior: Clip.hardEdge,
                  children: [
                    Container(
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
                        padding: EdgeInsets.only(
                          left: 5.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //padding: EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                iter.originalName,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.orange,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    child: Text(
                                      iter.character,
                                      style: TextStyle(
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

    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: castImagesList(),
      ),
    );
  }
}

class MovieDetailsDisplay extends StatelessWidget {
  final MovieDetails movieDetails;

  String runTimeConversion(String runTime) {
    int minutes = int.parse(runTime);
    int hours = 0;
    if (minutes < 60) {
      return "$minutes m";
    } else if (minutes == 60) {
      return "1 h";
    } else {
      hours = minutes ~/ 60;
      minutes = minutes - (hours * 60);
      if (minutes == 0) {
        return "$hours h";
      } else {
        return "$hours h $minutes m";
      }
    }
  }

  final currencyConverter = new NumberFormat("#,##0.00", "en_US");
  final dateFormatter = new DateFormat.yMMMMd('en_US');

  String currencyAmountFormatter(String amount) {
    var parsedAmount = double.parse(amount);
    var convertedCurrencyAmount = currencyConverter.format(parsedAmount);
    //print(convertedCurrencyAmount);
    return "\$$convertedCurrencyAmount";
  }

  String dateConverter(String dateString) {
    var rawDate = dateString;
    var parsedDate = DateTime.parse(dateString);
    var requiredFormat = dateFormatter.format(parsedDate);
    //print(requiredFormat);
    //print(parsedDate);
    return requiredFormat.toString();
  }

  _launchURL(String url) async {
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
    String genreResult = "";
    int length = type.length - 1;
    int counter = 0;
    for (var iter in type) {
      if (counter < length) {
        genreResult = genreResult + iter.name.toString() + ", ";
        counter++;
      } else {
        genreResult = genreResult + iter.name.toString();
      }
    }

    return Text(
      genreResult,
      style: TextStyle(color: Colors.white),
    );
  }

  MovieDetailsDisplay({Key key, this.movieDetails}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(movieDetails);
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Original Title:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Status:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Runtime:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Type:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Premiere:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Budget:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Revenue:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Homepage:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Text(
                "Imdb:",
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          //Column(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetails.originalTitle,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                movieDetails.status,
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                //movieDetails.runtime.toString(),
                runTimeConversion(movieDetails.runtime.toString()),
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              genreGenerateAboutSection(movieDetails.type.toList()),
              /* Text(
                //"Genre",
                movieDetails.type.toString(),
                style: TextStyle(color: Colors.white),
              ),*/
              Spacer(),
              Text(
                //movieDetails.premiere,
                dateConverter(movieDetails.premiere),
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                // "\$${movieDetails.budget.toString()}",
                currencyAmountFormatter(movieDetails.budget.toString()),
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                //"\$${movieDetails.revenue.toString()}",
                currencyAmountFormatter(movieDetails.revenue.toString()),
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              InkWell(
                onTap: () => _launchURL(movieDetails.homepage),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    movieDetails.homepage,
                    style: TextStyle(color: Colors.blue),
                    // softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                child: Text(
                  "https://www.imdb.com/title/${movieDetails.imdbId}",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () => _launchURL(
                    "https://www.imdb.com/title/${movieDetails.imdbId}"),
              ),
              /*Text(
                "https://www.imdb.com/title/${movieDetails.imdbId}",
                style: TextStyle(color: Colors.blue),
              ),*/
              Spacer(),
            ],
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class MoviesListCustom extends StatelessWidget {
  final List<Movie> movies;

  MoviesListCustom({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
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
  final String movieTitle;
  TicketFareDetails({Key key, this.movieTitle}) : super(key: key);

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
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "How many seats",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                DropdownButton(
                  value: selectedItem,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  onChanged: (String string) =>
                      setState(() => selectedItem = string),
                  selectedItemBuilder: (BuildContext context) {
                    return items.map<Widget>((String item) {
                      return Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    }).toList();
                  },
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        item,
                        style: TextStyle(
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
          DrawerDivider(),
          Row(
            children: [
              Spacer(),
              TicketFare(
                seat: "Balcony",
                price: "₹150.0",
                status: "Available",
              ),
              TicketFare(
                seat: "First-Class",
                price: "₹120.0",
                status: "Available",
              ),
              Spacer(),
            ],
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                //print("pressed");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookTicketsPage(
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
                "Select Seats",
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
  final String backDropPath;
  final String posterPath;

  MovieCarouselSlider({
    Key key,
    this.backDropPath,
    this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            //color: Colors.blue,
            child: Image.network(
              imageSource + backDropPath,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            //color: Colors.blue,
            child: Image.network(
              imageSource + backDropPath,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            //color: Colors.blue,
            child: Image.network(
              imageSource + backDropPath,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            //color: Colors.blue,
            child: Image.network(
              imageSource + backDropPath,
              fit: BoxFit.fill,
            ),
          ),
          Container(
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
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 1.0,
        ),
      ),
    );
  }
}
