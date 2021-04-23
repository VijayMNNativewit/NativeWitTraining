import 'package:flutter/material.dart';
import 'package:tabbar/utils/custom_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.all(10.0),
          //width: MediaQuery.of(context).size.width * 0.8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
            color: Colors.grey.withOpacity(0.25),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              Text(
                "Search for a movie, tv show, person",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width * 1.0,
        //height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 15.0,
                top: 15.0,
                left: 5.0,
                right: 5.0,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "In Theaters",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  )),
                  Icon(
                    Icons.more_vert,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ImageCard(
                          imageSource:
                              "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-14-600w-1185075061.jpg",
                        ),
                        ImageCard(
                          imageSource:
                              "https://image.shutterstock.com/image-photo/kuala-lumpur-malaysia-september-23-600w-724201312.jpg",
                        ),
                        ImageCard(
                          imageSource:
                              "https://image.shutterstock.com/image-photo/bangkok-thailand-30-july-2019-600w-1469937725.jpg",
                        ),
                        ImageCard(
                          imageSource:
                              "https://image.shutterstock.com/image-photo/bangkok-thailand-sep-17-2020-600w-1819014005.jpg",
                        ),
                      ],
                      shrinkWrap: true,
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
