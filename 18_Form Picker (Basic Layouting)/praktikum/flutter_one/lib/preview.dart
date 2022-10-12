import 'package:flutter/material.dart';
import 'package:flutter_one/main.dart';

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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Balik'),
          ),
          ListView.builder(
              itemBuilder: (context, index) =>
                  Text(dataPreview[index]['publishAt']))
        ],
      ),
    );
  }
}
