import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'barcode',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              barcode('Alterra Academy'),
              barcode('Flutter Asik'),
              barcode('Benediktus Satriya Mukti')
            ],
          ),
        ),
      ),
    );
  }

  BarcodeWidget barcode(String data) {
    return BarcodeWidget(
      barcode: Barcode.code128(),
      data: data,
      width: 200,
      height: 100,
    );
  }
}
