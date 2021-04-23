import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/utils/custom_widgets.dart';

class HomePageRich extends StatefulWidget {
  @override
  _HomePageRichState createState() => _HomePageRichState();
}

class _HomePageRichState extends State<HomePageRich> {
  void movieListGenerate() {
    for (var iter = 0; iter < movieNameList.length; iter++) {
      movieDetails.add(
        MovieDescription(
          backDropImageSource: backDropImageSourceList[iter],
          movieRecentIndicator: movieRecentIndicatorList[iter],
          movieDescription: movieDescriptionList[iter],
          movieRatings: movieRatingsList[iter],
          movieName: movieNameList[iter],
        ),
      );
    }
  }

  List<MovieDescription> movieDetails = [];

  MovieDescription currentmovie;
  //int currentindex = 0;
  // ScrollController _controller;

  List<String> backDropImageSourceList = [
    "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-14-600w-1185075061.jpg",
    "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-23-600w-724201312.jpg",
    "https://image.shutterstock.com/image-photo/bangkok-thailand-30-july-2019-600w-1469937725.jpg",
    "https://image.shutterstock.com/image-photo/bangkok-thailand-sep-17-2020-600w-1819014005.jpg",
  ];
  List<String> movieNameList = ["Johnny English", "Foreigner", "Dora", "Tenet"];
  List<List<String>> movieRatingsList = [
    [
      "Popular with Friends",
      "18+",
      "8",
    ],
    [
      "Popular with Family",
      "10+",
      "7.5",
    ],
    [
      "Popular with Kids",
      "8+",
      "7.9",
    ],
    [
      "Popular with Friends",
      "18+",
      "9.5",
    ],
  ];
  List<List<String>> movieDescriptionList = [
    [
      "2019",
      "Comedy, Detective, Action",
      "Datasat, DolbyDigital",
    ],
    [
      "2018",
      "Comedy, Action, Adventure",
      "Datasat, DolbyDigital",
    ],
    [
      "2020",
      "Comedy, Drama",
      "DolbyDigital",
    ],
    [
      "2020",
      "Sci Fi, Adventure, Action",
      "DolbyDigital, iMax",
    ],
  ];
  List<List<String>> movieRecentIndicatorList = [
    ["New", "Movie"],
    ["Old", "Movie"],
    ["Good", "Movie"],
    ["New", "Movie"],
  ];

  /* _scrollListener() {
    print(_controller.position);
  }*/
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.4,
  );
  callBackPage(page) {
    setState(() {
      currentmovie = movieDetails[page];
      //print(page.toString(),);
      //print(controller.page.toString(),);
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    movieListGenerate();
    movieListGenerate();
    currentmovie = movieDetails[0];
    // _controller = ScrollController();
    // _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    controller.dispose();
    super.dispose();
  }
  /*void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }
  */

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MovieImage(
              imageSource: currentmovie.backDropImageSource,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 50.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.only(left: 10.0),
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Search Movies...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      //padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          /*Text("NEW . MOVIE", style: TextStyle(color: Colors.black),
                          ),*/
                          Container(
                            padding: EdgeInsets.only(
                              top: 20.0,
                            ),
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.35,
                            ),
                            child: Row(
                              children: [
                                TextWidgetNormal(
                                  message:
                                      currentmovie.movieRecentIndicator[0] +
                                          "  ",
                                  colorData: Colors.black,
                                ),
                                ContainerCircle(
                                  color: Colors.black,
                                ),
                                TextWidgetNormal(
                                  message:
                                      currentmovie.movieRecentIndicator[1] +
                                          "  ",
                                  colorData: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            currentmovie.movieName,
                            style:
                                TextStyle(fontSize: 50.0, color: Colors.black),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                width: MediaQuery.of(context).size.width * 0.45,
                                height:
                                    MediaQuery.of(context).size.width * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.black.withOpacity(0.75),
                                ),
                                child: Text(
                                  currentmovie.movieRatings[0],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.only(left: 15.0),
                                width: MediaQuery.of(context).size.width * 0.15,
                                height:
                                    MediaQuery.of(context).size.width * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.black.withOpacity(0.75),
                                ),
                                child: Text(
                                  currentmovie.movieRatings[1],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.only(left: 15.0),
                                width: MediaQuery.of(context).size.width * 0.20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.yellow.withOpacity(0.95),
                                ),
                                //child: Text("8.7/10", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: currentmovie.movieRatings[2],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "/10",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidgetNormal(
                                message:
                                    currentmovie.movieDescription[0] + "  ",
                                colorData: Colors.black,
                              ),
                              ContainerCircle(
                                color: Colors.yellow,
                              ),
                              TextWidgetNormal(
                                message:
                                    currentmovie.movieDescription[1] + "  ",
                                colorData: Colors.black,
                              ),
                              ContainerCircle(
                                color: Colors.yellow,
                              ),
                              TextWidgetNormal(
                                message:
                                    currentmovie.movieDescription[2] + "  ",
                                colorData: Colors.black,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.red,
                            height: 20,
                            indent: 70,
                            endIndent: 100,
                          ),
                          Container(
                            //width: double.infinity,
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: MediaQuery.of(context).size.height * 0.059,
                            padding: EdgeInsets.all(5.0),
                            margin: EdgeInsets.all(5.0),
                            child: ElevatedButton(
                              child: const Text(
                                'BUY TICKET',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side:
                                              BorderSide(color: Colors.red)))),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            /*child: PageView(
                              scrollDirection: Axis.horizontal,
                              controller: controller,
                              onPageChanged: callBackPage,
                              children: [
                                Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.3,
                            padding: EdgeInsets.all(20.0),
                            margin: EdgeInsets.all(10.0),
                            child: Image.network(currentmovie.backDropImageSource),
                            ),

                              ],

                            ),*/
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: controller,
                              itemCount: movieDetails.length,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(10.0),
                                  child: Image.network(
                                      movieDetails[index].backDropImageSource),
                                );
                              },
                              onPageChanged: callBackPage,
                            ),

                            /*child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: _controller,
                              itemCount: movieDetails.length,
                              itemBuilder: (BuildContext context, int index){
                                return Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(10.0),
                                  color: Colors.red,
                                );
                              },

                             /* children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(10.0),
                                  color: Colors.red,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(10.0),
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(20.0),
                                  color: Colors.red,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(20.0),
                                  color: Colors.blue,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(20.0),
                                  color: Colors.red,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(20.0),
                                  color: Colors.blue,
                                ),
                              ],*/
                            ), */
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDescription {
  final String backDropImageSource;
  final String movieName;
  List<String> movieRecentIndicator = List<String>.filled(2, " ");
  List<String> movieRatings = List<String>.filled(3, " ");
  List<String> movieDescription = List<String>.filled(3, " ");

  MovieDescription({
    this.backDropImageSource,
    this.movieName,
    this.movieRecentIndicator,
    this.movieRatings,
    this.movieDescription,
  });
}
