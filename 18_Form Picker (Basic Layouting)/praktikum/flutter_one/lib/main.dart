import 'package:flutter/material.dart';
import 'package:flutter_one/preview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Post',
      home: Post(),
    );
  }
}

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

List dataPreview = [
    {
      'publishAt': '',
      'colorTheme': '',
      'caption': '',
    }
  ];

class _PostState extends State<Post> {
  final _formKey = GlobalKey<FormState>();
  final publishAtController = TextEditingController();
  final colorThemeController = TextEditingController();
  final captionController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cover',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                    child: const Text('Pilih File'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Publish At',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                TextField(
                  controller: publishAtController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'dd/mm/yyyy'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Color Theme',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                TextField(
                  controller: colorThemeController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Pick a color'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Caption',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                TextField(
                  controller: captionController,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Pick a color'),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final preview = {
                          'publishAt': publishAtController.text,
                          'colorTheme': colorThemeController.text,
                          'caption': captionController.text,
                        };

                        dataPreview.add(preview);

                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const Preview();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(
                                  begin: const Offset(0, .5), end: Offset.zero);

                              return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child);
                            },
                          ),
                        );
                      }
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
// Praktikum belom selesai