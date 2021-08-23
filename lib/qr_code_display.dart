// Copyright 2021, Techaas.com. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeDisplay extends StatelessWidget {
  final String message;

  QRCodeDisplay({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.all(10),
            child: QrImage(
              data: message,
              version: QrVersions.auto,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              message,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          )
        ]));
  }
}
