// Copyright 2021, Techaas.com. All rights reserved.
//

import 'package:flutter/material.dart';

class QRCodeScanPage extends StatefulWidget {
  QRCodeScanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _QRCodeScanPageState createState() => _QRCodeScanPageState();
}

class _QRCodeScanPageState extends State<QRCodeScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)), body: Container());
  }
}
