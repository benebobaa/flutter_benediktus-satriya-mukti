import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  final String date;
  final String colors;
  final String caption;
  final image;

  const Preview(
      {super.key,
      required this.image,
      required this.date,
      required this.colors,
      required this.caption});

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      switch (colors) {
        case "red":
          return Colors.red;
        case "blue":
          return Colors.blue;
        case "yellow":
          return Colors.yellow;
        case "orange":
          return Colors.orange;
        case "green":
          return Colors.green;
        default:
          return Colors.transparent;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Column(
        children: [
          image != null
              ? SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.file(image!),
                )
              : const SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ColoredBox(color: Colors.blue),
                ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Published:  $date',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Color:  ',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: getColor(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            caption,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
