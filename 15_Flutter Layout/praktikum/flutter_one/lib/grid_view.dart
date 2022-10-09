import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Grid View',
      home: GridIcons(),
    );
  }
}

class GridIcons extends StatefulWidget {
  const GridIcons({super.key});

  @override
  State<GridIcons> createState() => _GridIconsState();
}

class _GridIconsState extends State<GridIcons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 40,
            crossAxisSpacing: 40,
            children: const [
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.pets,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.pregnant_woman,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.spatial_audio_off,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.rounded_corner,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.rowing,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.timeline,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.update,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.access_time_filled,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.back_hand,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.euro,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.g_translate,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.restore_page,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.speaker_notes_off,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.accessibility,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.done_outline,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.maximize,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.minimize,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.offline_bolt_rounded,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.swap_horizontal_circle,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.accessible_forward,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
