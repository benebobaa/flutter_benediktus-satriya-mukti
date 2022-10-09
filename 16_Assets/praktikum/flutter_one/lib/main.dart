import 'package:flutter/material.dart';
import 'gambar_satu.dart';
import 'gambar_dua.dart';
import 'gambar_tiga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Gambar());
  }
}

class Gambar extends StatelessWidget {
  const Gambar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assets',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Assets'),
        ),
        body: GridView.count(
          padding: const EdgeInsets.only(top: 40),
          crossAxisCount: 3,
          children: [
            SizedBox(
              child: InkWell(
                child: Image.network(
                    'https://i.pinimg.com/564x/a9/d5/42/a9d542b200478156d65a6aaf043f0319.jpg'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GambarSatu()));
                },
              ),
            ),
            SizedBox(
              child: InkWell(
                child: Image.network(
                    'https://i.pinimg.com/564x/e8/78/83/e8788343739ee604b623a3ea76142616.jpg'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GambarDua()));
                },
              ),
            ),
            SizedBox(
              child: InkWell(
                child: Image.network(
                    'https://i.pinimg.com/564x/e7/5f/66/e75f668018101587bc1a62cf33902046.jpg'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GambarTiga()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
