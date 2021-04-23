import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:show_movies/model/movie.dart';
import 'package:show_movies/network/network_service.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:show_movies/views/home/home_page.dart';

class BookTicketsPage extends StatefulWidget {
  int seatCounts;
  String movieTitle;
  BookTicketsPage({
    Key key,
    this.seatCounts,
    this.movieTitle,
  }) : super(key: key);

  @override
  _BookTicketsPageState createState() => _BookTicketsPageState();
}

class _BookTicketsPageState extends State<BookTicketsPage> {
  List<String> seatPopulator() {
    List<String> populator = [];
    List<String> baseSelector = ['A', 'B', 'C', 'D', 'E', 'F'];
    for (var iter = 1; iter <= 20; iter++) {
      for (var sel in baseSelector) {
        populator.add("$sel$iter");
      }
    }
    return populator;
  }

  List<Color> seatColor = List.filled(
    120,
    Colors.blueGrey,
  );

  List<String> seats;
  int selectedSeatCounts;
  int seatCounts;
  String bookingStatus;

  @override
  void initState() {
    selectedSeatCounts = 0;
    seats = seatPopulator();
    seatCounts = widget.seatCounts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: BackButton(),
        /*leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            print("works");
            Navigator.of(context).pop();
          },
        ),*/
        /*IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),*/

        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              widget.movieTitle,
            ),
            Expanded(child: Container()),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(
              15.0,
            ),
            child: Text(
              "${widget.seatCounts} Tickets",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                20.0,
              ),
              child: Text(
                "Screen",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            DrawerDivider(),
            Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                ),
                itemCount: seats.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //print("pressed");
                      setState(() {
                        // seatColor[index] = Colors.green;
                        /* seatColor[index] == Colors.blueGrey
                              ? seatColor[index] = Colors.green
                              : seatColor[index] = Colors.blueGrey; */
                        if (selectedSeatCounts < seatCounts &&
                            seatColor[index] == Colors.blueGrey) {
                          seatColor[index] = Colors.green;
                          selectedSeatCounts++;
                        } else if (selectedSeatCounts <= seatCounts &&
                            seatColor[index] == Colors.green) {
                          seatColor[index] = Colors.blueGrey;
                          selectedSeatCounts--;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      margin: EdgeInsets.all(
                        5.0,
                      ),
                      decoration: BoxDecoration(
                          color: seatColor[index],
                          border: Border.all(
                            color: Colors.green,
                            width: 4,
                          )),
                      child: Center(
                        child: Column(children: [
                          Icon(Icons.event_seat),
                          Text(
                            "${seats[index]}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedSeatCounts == seatCounts) {
                    bookingStatus = "Booking Confirmed";
                  } else {
                    bookingStatus = "Select all the seats";
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        bookingStatus,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                child: Text(
                  "BOOK",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
