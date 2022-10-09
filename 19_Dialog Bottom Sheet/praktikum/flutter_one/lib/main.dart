import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Gallery(),
    );
  }
}

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List gambar = [
    'https://i.pinimg.com/564x/ed/f4/e9/edf4e955450a895b140d4ce99c8c6b5e.jpg',
    'https://i.pinimg.com/736x/70/ca/d3/70cad35f7eb39622741ef42a95e431cc.jpg',
    'https://i.pinimg.com/564x/fd/16/58/fd16580022e3977ac5574d2e12f1e210.jpg',
    'https://i.pinimg.com/originals/07/aa/79/07aa795b732b720c31815558605a7b5c.gif',
    'https://i.pinimg.com/originals/81/5d/89/815d895b4721c14cbe7c86c63806d6c8.gif',
    'https://i.pinimg.com/originals/e0/93/25/e09325884a55b2e1b1d9f6e89efd422b.gif'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          sebuahGambar(context, gambar[0]),
          sebuahGambar(context, gambar[1]),
          sebuahGambar(context, gambar[2]),
          sebuahGambar(context, gambar[3]),
          sebuahGambar(context, gambar[4]),
          sebuahGambar(context, gambar[5]),
        ],
      ),
    );
  }

  InkWell sebuahGambar(BuildContext context, String gambar) {
    return InkWell(
      child: Image.network(gambar),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Image.network(gambar);
          },
        );
      },
      onDoubleTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Image.network(gambar);
          },
        );
      },
    );
  }
}
