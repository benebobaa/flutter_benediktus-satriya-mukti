import 'package:flutter/material.dart';
import 'package:flutter_one/preview.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

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

class _PostState extends State<Post> {
  FilePickerResult? result;
  File? fileToDisplay;
  PlatformFile? pickedFile;

  Future getPath() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    if (result != null) {
      pickedFile = result!.files.first;
      fileToDisplay = File(pickedFile!.path.toString());
    }

    return fileToDisplay;
  }

  final _formKey = GlobalKey<FormState>();
  final publishAtController = TextEditingController();
  final colorThemeController = TextEditingController();
  final captionController = TextEditingController();

  String dateToSend = '';
  String colorToSend = '';
  String captionToSend = '';

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
                    onPressed: () {
                      getPath();
                    },
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

                        dateToSend = publishAtController.text;
                        colorToSend = colorThemeController.text;
                        captionToSend = captionController.text;

                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Preview(
                                  image: fileToDisplay,
                                  date: dateToSend,
                                  colors: colorToSend,
                                  caption: captionToSend);
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