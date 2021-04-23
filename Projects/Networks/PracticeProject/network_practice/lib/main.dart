import 'package:flutter/material.dart';
import 'package:network_practice/network/fetch_data.dart';
import 'package:network_practice/network/delete_data.dart';
import 'package:network_practice/network/fetch_data_background.dart';
import 'package:network_practice/network/send_data.dart';
import 'package:network_practice/network/update_data.dart';
import 'package:network_practice/utils/web_socket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FetchData();
    // return DeleteData();
    // return FetchPhoto();
    // return SendData();
    // return UpdateData();

    //WebSocketExample();

    /*return MaterialApp(
      title: 'Flutter Network practice project',
      home: FetchData(),
    );*/
  }
}
