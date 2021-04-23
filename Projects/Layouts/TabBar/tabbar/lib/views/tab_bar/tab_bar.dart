import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabbar/views/accounts_page/accounts_page.dart';
import 'package:tabbar/views/alternate/home_page_rich.dart';
import 'package:tabbar/views/coming_page/coming_page.dart';
import 'package:tabbar/views/discover_page/discover_page.dart';
import 'package:tabbar/views/home_page/home_page.dart';

class TabBarWidget extends StatefulWidget {
  TabBarWidget({Key key}) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _selectedIndex = 0;
  bool _showNavigationBar = true;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePageRich(),
    DiscoverPage(),
    ComingPage(),
    AccountsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //print(index);
      if (index == 1) {
        _showNavigationBar = false;
      } else {
        _showNavigationBar = true;
      }
      //print(_showNavigationBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: _showNavigationBar
            ? BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "HomeRich",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.movie),
                    label: "Discover",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today),
                    label: "Coming",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: "Account",
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                onTap: _onItemTapped,
                showUnselectedLabels: true,
              )
            : null);
  }
}
