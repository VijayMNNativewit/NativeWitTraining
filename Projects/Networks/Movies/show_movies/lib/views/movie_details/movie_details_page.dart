import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:show_movies/utils/custom_widgets.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    Key key,
    this.currentMovie,
    this.index,
  }) : super(key: key);
  final Movie currentMovie;

  final int index;

  @override
  MovieDetailsPageState createState() => MovieDetailsPageState();
}

class MovieDetailsPageState extends State<MovieDetailsPage> {
  final BuiltList<MovieGenre> genreLists = Singleton().genreParsed.results;

  int index;

  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  final int _totalDots = 5;
  double _currentPosition = 0.0;
  //
  // double _validPosition(double position) {
  //   if (position >= _totalDots) {
  //     return 0;
  //   }
  //   if (position < 0) {
  //     return _totalDots - 1.0;
  //   }
  //   return position;
  // }
  //
  // void _updatePosition(double position) {
  //   setState(() => _currentPosition = _validPosition(position));
  // }

  void updatePosition(int index) {
    setState(() {
      _currentPosition = index.toDouble();
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.removeListener(() {});
    _scrollViewController.dispose();
    super.dispose();
  }

  Widget carouselSliderFunction() {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Image.network(
            NetworkApiRoutes.imageSource +
                widget.currentMovie.backDropPath.toString(),
            fit: BoxFit.fill,
          ),
        );
      },
      options: CarouselOptions(
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          updatePosition(index);
          //print(index);
        },
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

  @override
  Widget build(BuildContext context) {
    const DotsDecorator decorator = DotsDecorator(
      activeColor: Colors.green,
      //activeSize: Size.square(30.0),
      //activeShape: RoundedRectangleBorder(),
    );
    index = widget.index.toInt();
    //print(widget.currentMovie);
    return Scaffold(
      //extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              height: _showAppbar ? 56.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: AppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                // leading: IconButton(
                //   icon: const Icon(
                //     Icons.arrow_back,
                //     size: 30.0,
                //   ),
                //   onPressed: () => Navigator.pop(context),
                // ),
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
                      child: Text(
                        'BOOK-TICKET',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollViewController,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: const Color.fromRGBO(49, 49, 61, 0.7),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.40,
                              child: Stack(
                                children: <Widget>[
                                  carouselSliderFunction(),
                                  // MovieCarouselSlider(
                                  //   backDropPath: widget
                                  //       .currentMovie.backDropPath
                                  //       .toString(),
                                  //   posterPath: widget.currentMovie.posterPath
                                  //       .toString(),
                                  // ),
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12,
                                          child: DotsIndicator(
                                            dotsCount: _totalDots,
                                            position: _currentPosition,
                                            decorator: decorator,
                                          ),
                                          //color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.20,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Wrap(
                                                    spacing: 16.0,
                                                    children: <Widget>[
                                                      Chip(
                                                        label: Text(
                                                          widget.currentMovie
                                                              .releaseDate
                                                              .substring(0, 4)
                                                              .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                        ),
                                                        backgroundColor:
                                                            Colors.orange,
                                                      ),
                                                      Chip(
                                                        label: Text(
                                                          widget.currentMovie
                                                              .voteAverage
                                                              .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                        ),
                                                        backgroundColor:
                                                            Colors.orange,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                widget
                                                    .currentMovie.originalTitle,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                child: GenreChipsGenerate(
                                                  genreIds: widget
                                                      .currentMovie.genreIds,
                                                  genreLists: genreLists,
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
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    //color: Colors.green,
                                    child: Hero(
                                      tag: 'poster$index',
                                      child: Image.network(
                                        NetworkApiRoutes.imageSource +
                                            widget.currentMovie.posterPath
                                                .toString(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    margin: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    //color: Colors.blue,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'SYNOPSIS',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        Text(
                                          widget.currentMovie.overview,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          softWrap: true,
                                          maxLines: 6,
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
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cast',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    margin: const EdgeInsets.only(top: 4.0),
                                    //color: Colors.red,
                                    child: FutureBuilder<MovieCastResults>(
                                      future: NetworkApiRoutes.fetchCastDetails(
                                        widget.currentMovie.id,
                                      ),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<MovieCastResults>
                                              snapshot) {
                                        if (snapshot.hasError) {
                                          print(snapshot.error);
                                        }

                                        return snapshot.hasData
                                            ? MovieCastList(
                                                movieCasts:
                                                    snapshot.data.castResults)
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              //color: Colors.green,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.40,
                              padding: const EdgeInsets.only(
                                left: 14.0,
                                top: 4.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'About',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    //color: Colors.red,
                                    child: FutureBuilder<MovieDetails>(
                                      future:
                                          NetworkApiRoutes.fetchMovieDetails(
                                        widget.currentMovie.id,
                                      ),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<MovieDetails>
                                              snapshot) {
                                        if (snapshot.hasError) {
                                          print(snapshot.error);
                                        }

                                        return snapshot.hasData
                                            ? MovieDetailsDisplay(
                                                movieDetails: snapshot.data)
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.60,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 14.0,
                                      top: 4.0,
                                    ),
                                    child: Text(
                                      'Similar',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  FutureBuilder<MovieResults>(
                                    future: NetworkApiRoutes.fetchSimilarMovies(
                                        widget.currentMovie.id),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<MovieResults> snapshot) {
                                      if (snapshot.hasError) {
                                        print(snapshot.error);
                                      }

                                      return snapshot.hasData
                                          ? MoviesListCustom(
                                              movies: snapshot.data.results)
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), //add your screen content here
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

// class MovieCarouselSlider extends StatelessWidget {
//   MovieCarouselSlider({
//     Key key,
//     this.backDropPath,
//     this.posterPath,
//   }) : super(key: key);
//   final String backDropPath;
//
//   final String posterPath;
//
//   MovieDetailsPageState obj = MovieDetailsPageState();
//
//   @override
//   Widget build(BuildContext context) {
//     // return CarouselSlider(
//     //   items: <Widget>[
//     //     SizedBox(
//     //       height: MediaQuery.of(context).size.height * 0.35,
//     //       child: Image.network(
//     //         NetworkApiRoutes.imageSource + backDropPath,
//     //         fit: BoxFit.fill,
//     //       ),
//     //     ),
//     //     SizedBox(
//     //       height: MediaQuery.of(context).size.height * 0.35,
//     //       child: Image.network(
//     //         NetworkApiRoutes.imageSource + backDropPath,
//     //         fit: BoxFit.fill,
//     //       ),
//     //     ),
//     //     SizedBox(
//     //       height: MediaQuery.of(context).size.height * 0.35,
//     //       child: Image.network(
//     //         NetworkApiRoutes.imageSource + backDropPath,
//     //         fit: BoxFit.fill,
//     //       ),
//     //     ),
//     //     SizedBox(
//     //       height: MediaQuery.of(context).size.height * 0.35,
//     //       child: Image.network(
//     //         NetworkApiRoutes.imageSource + backDropPath,
//     //         fit: BoxFit.fill,
//     //       ),
//     //     ),
//     //     SizedBox(
//     //       height: MediaQuery.of(context).size.height * 0.35,
//     //       child: Image.network(
//     //         NetworkApiRoutes.imageSource + backDropPath,
//     //         fit: BoxFit.fill,
//     //       ),
//     //     ),
//     //   ],
//     //   options: CarouselOptions(
//     //     //onPageChanged: () {},
//     //     height: MediaQuery.of(context).size.height * 0.35,
//     //     enlargeCenterPage: false,
//     //     //pageSnapping: false,
//     //     autoPlay: true,
//     //     aspectRatio: 16 / 9,
//     //     autoPlayCurve: Curves.fastOutSlowIn,
//     //     enableInfiniteScroll: true,
//     //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
//     //     viewportFraction: 1.0,
//     //   ),
//     // );
//
//     return CarouselSlider.builder(
//       itemCount: 5,
//       itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
//         return SizedBox(
//           height: MediaQuery.of(context).size.height * 0.35,
//           child: Image.network(
//             NetworkApiRoutes.imageSource + backDropPath,
//             fit: BoxFit.fill,
//           ),
//         );
//       },
//       options: CarouselOptions(
//         onPageChanged: (int index, CarouselPageChangedReason reason) {
//           //updatePosition(index);
//           obj.updatePosition(index);
//           print(index);
//         },
//         height: MediaQuery.of(context).size.height * 0.35,
//         enlargeCenterPage: false,
//         //pageSnapping: false,
//         autoPlay: true,
//         aspectRatio: 16 / 9,
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enableInfiniteScroll: true,
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         viewportFraction: 1.0,
//       ),
//     );
//   }
// }
