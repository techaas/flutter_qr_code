// Copyright 2021, Techaas.com. All rights reserved.
//

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeImagePage extends StatefulWidget {
  QRCodeImagePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _QRCodeImagePageState createState() => _QRCodeImagePageState();
}

class _QRCodeImagePageState extends State<QRCodeImagePage> {
  bool _showActionButton = true;
  Image? _image;
  String? _checksum;

  @override
  initState() {
    super.initState();
    rootBundle.load('images/TECHaas_logo.png').then((imageData) {
      final Uint8List data = imageData.buffer.asUint8List();
      final Digest digest = sha256.convert(data);
      debugPrint('digest: $digest');

      setState(() {
        _image = Image.memory(data);
        _checksum = digest.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
              child: Container(
            color: Colors.white,
            child: _image,
          )),
          if (!_showActionButton && _checksum != null) ...[
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: () => {
                        setState(() => {_showActionButton = true})
                      },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                        ),
                        child: QrImage(
                          size: 200,
                          data: _checksum!,
                          version: QrVersions.auto,
                        ),
                      ))),
            ),
          ],
        ],
      ),
      floatingActionButton: _showActionButton
          ? FloatingActionButton(
              onPressed: () => {setState(() => _showActionButton = false)},
              tooltip: 'Show Code',
              child: const Icon(Icons.qr_code),
            )
          : null,
    );
  }
}
