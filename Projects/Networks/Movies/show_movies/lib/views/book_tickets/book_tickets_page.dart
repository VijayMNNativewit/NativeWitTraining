import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:show_movies/views/home/home_page.dart';

class BookTicketsPage extends StatefulWidget {
  const BookTicketsPage({
    Key key,
    this.seatCounts,
    this.movieTitle,
  }) : super(key: key);
  final int seatCounts;
  final String movieTitle;

  @override
  _BookTicketsPageState createState() => _BookTicketsPageState();
}

class _BookTicketsPageState extends State<BookTicketsPage> {
  List<String> seatPopulator() {
    final List<String> populator = <String>[];
    final List<String> baseSelector = <String>['A', 'B', 'C', 'D', 'E', 'F'];
    for (int iter = 1; iter <= 20; iter++) {
      for (final String sel in baseSelector) {
        populator.add('$sel$iter');
      }
    }
    return populator;
  }

  List<Color> seatColor = List<Color>.filled(
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: const BackButton(),
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
          children: <Widget>[
            Text(
              widget.movieTitle,
            ),
            Expanded(child: Container()),
          ],
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: Text(
              '${widget.seatCounts} Tickets',
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: const Text(
              'Screen',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
          const DrawerDivider(),
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemCount: seats.length,
              itemBuilder: (BuildContext context, int index) {
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
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    margin: const EdgeInsets.all(
                      5.0,
                    ),
                    decoration: BoxDecoration(
                        color: seatColor[index],
                        border: Border.all(
                          color: Colors.green,
                          width: 4,
                        )),
                    child: Center(
                      child: Column(children: <Widget>[
                        const Icon(Icons.event_seat),
                        Text(
                          seats[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (selectedSeatCounts == seatCounts) {
                  bookingStatus = 'Booking Confirmed';
                } else {
                  bookingStatus = 'Select all the seats';
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
              child: const Text(
                'BOOK',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
