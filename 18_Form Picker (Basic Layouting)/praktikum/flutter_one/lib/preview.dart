import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Balik'),
      ),
    );
  }
}
