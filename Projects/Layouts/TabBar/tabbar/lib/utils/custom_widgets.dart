import 'package:flutter/material.dart';
import 'package:tabbar/views/tab_bar/tab_bar.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    this.imageSource,
  }) : super(key: key);
  final String imageSource;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.network(
        imageSource,
        fit: BoxFit.fill,
      ),
    );
  }
}

class IconswithMessage extends StatelessWidget {
  const IconswithMessage({
    Key key,
    this.iconName,
    this.message,
  }) : super(
          key: key,
        );
  final String message;
  final IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Icon(
            iconName,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class PagewithMessage extends StatelessWidget {
  const PagewithMessage({
    Key key,
    this.message,
  }) : super(
          key: key,
        );
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: Colors.red,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key key,
    this.imageSource,
    this.percentage,
    this.movieTitle,
    this.releaseDate,
    this.message,
  }) : super(key: key);
  final String imageSource;
  final String percentage;
  final String movieTitle;
  final String releaseDate;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Card(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Image.network(
                imageSource,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          5.0,
                        ),
                        child: CircleAvatar(
                          child: Text(
                            percentage,
                          ),
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            movieTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            releaseDate,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        elevation: 5.0,
      ),
      //child: Image.network(imageSource, fit: BoxFit.fill,),
    );
  }
}

class SmallCard extends StatelessWidget {
  const SmallCard({
    Key key,
    this.imageSource,
    this.movieTitle,
    this.releaseDate,
    this.message,
    this.genre,
  }) : super(
          key: key,
        );
  final String imageSource;
  final List<String> genre;
  final String movieTitle;
  final String releaseDate;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 0.20,
      child: Card(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Image.network(
                imageSource,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Released on ${releaseDate}",
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var movieType in genre)
                              GenreMovie(genreType: movieType),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        elevation: 5.0,
      ),
    );
  }
}

class GenreMovie extends StatelessWidget {
  const GenreMovie({
    Key key,
    this.genreType,
  }) : super(
          key: key,
        );
  final String genreType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
      child: Text(
        genreType,
      ),
    );
  }
}

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key key,
    this.imageSource,
  }) : super(
          key: key,
        );
  final String imageSource;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageSource,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

class ContainerCircle extends StatelessWidget {
  const ContainerCircle({
    Key key,
    this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 5,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      //child: Text(" "),
    );
  }
}

class TextWidgetNormal extends StatelessWidget {
  const TextWidgetNormal({
    Key key,
    this.message,
    this.colorData,
  }) : super(key: key);
  final String message;
  final Color colorData;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        color: colorData,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.iconName,
    this.message,
    this.obscure = false,
    this.inputTypes = TextInputType.text,
  }) : super(key: key);
  final String message;
  final IconData iconName;
  final bool obscure;
  final TextInputType inputTypes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.50),
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: TextFormField(
              keyboardType: inputTypes,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  iconName,
                  color: Colors.white,
                  size: 35.0,
                ),
                hintText: message,
              ),
              initialValue: message,
              obscureText: obscure,
            ),
          ),
        ],
      ),
    );
  }
}

class MovieImages extends StatelessWidget {
  const MovieImages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/1917.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

class BackgroundColorBlur extends StatelessWidget {
  const BackgroundColorBlur({Key key, this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(value),
    );
  }
}

class TopTitle extends StatelessWidget {
  const TopTitle({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 45.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key key,
    this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
                //print("I have pressed");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabBarWidget(),
                  ),
                );
              },
              label: Text(
                message,
                style: TextStyle(
                  fontSize: 26.0,
                ),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: InkWell(
              onTap: () {
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));*/

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: PagewithMessage(
                        message: "Forgot Password",
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
