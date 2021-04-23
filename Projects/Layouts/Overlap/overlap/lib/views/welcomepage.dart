import 'package:flutter/material.dart';
import 'package:overlap/views/loginpage.dart';
import 'package:overlap/views/registerpage.dart';
import 'package:overlap/views/customwidgets.dart';


class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          MovieImage(),
          BackgroundColorBlur(value: 0.75,),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(25.0),
              padding: EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Movies",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    "From idea to project plan. we'll work to research, define and validate your product.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // Add your onPressed code here!
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginPage()));
                        //print("I have pressed");
                      },
                      label: const Text('Continue', style: TextStyle(fontSize: 26.0,),),
                      backgroundColor: Colors.blue,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


