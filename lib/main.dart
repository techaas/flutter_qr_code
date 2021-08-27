// Copyright 2021, Techaas.com. All rights reserved.
//

import 'package:flutter/material.dart';

import 'qr_code_display.dart';
import 'qr_code_image.dart';
import 'qr_code_scan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRCode Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => MyHomePage(title: 'Flutter QRcode'),
        '/checksum': (BuildContext context) => QRCodeImagePage(title: 'SHA256 digest'),
        '/scan': (BuildContext context) => QRCodeScanPage(title: 'Scan code'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            tooltip: 'スキャン',
            padding: EdgeInsets.only(right: 15.0),
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, '/scan');
            },
          ),
        ]),
        body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 1.0) {}
          if (details.primaryVelocity! < -1.0) {
            Navigator.pushNamed(context, '/checksum');
          }
        },
        // onTap: () => {Navigator.pushNamed(context, '/checksum')},
        child: Container(
            color: Colors.grey,
            child: Center(child: QRCodeDisplay(message: 'https://www.techaas.net/')))));
  }
}
