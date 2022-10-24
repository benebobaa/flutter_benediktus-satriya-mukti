
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                buttonDrawer('About Us'),
                const SizedBox(
                  height: 20,
                ),
                buttonDrawer('Contact Us'),
                const SizedBox(
                  height: 20,
                ),
                buttonDrawer('Login'),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Image.network(
              'https://academy.alterra.id/wp-content/uploads/2022/06/Logo-Colour-Transparant-1.png'),
        ),
        actions: [
          IconButton(
              onPressed: () => _key.currentState!.openEndDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.redAccent,
            child: Stack(
              children: [
                Image.asset("assets/bg-img.jpg"),
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(100, 22, 44, 33),
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      const Text(
                        textAlign: TextAlign.center,
                        "Coding Bootcamp Penghasil Programmer dengan Kualitas Tinggi di Indonesia",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Alterra Academy adalah coding bootcamp indonesia untuk semua orang, baik dengan background IT & non-IT untuk menjadi Programmer dengan kualitas terbaik di Industri saat ini.',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.orange,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Pelajari Lebih Lanjut',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Message',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.indigo,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: const [Icon(Icons.send), Text('Send')],
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const Text(
                'About Us',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Alterra Academy Programs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  cardProgram(),
                  const SizedBox(width: 10),
                  cardProgram(),
                ],
              )
            ],
          ),
          const SizedBox(height: 200),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home2',
            ),
        ],
      ),
    );
  }

  SizedBox buttonDrawer(String s) => SizedBox(
        width: 140,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo,
          ),
          child: Text(
            s,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );

  Card cardProgram() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      color: Colors.grey[300],
      shadowColor: Colors.grey[300],
      child: SizedBox(
        height: 180,
        width: 180,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const [
              Icon(
                Icons.my_library_books_outlined,
                color: Colors.blue,
                size: 30,
              ),
              SizedBox(height: 10),
              Text(
                'Immersive Program',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Program Pelatihan coding bootcamp intensif bagi kamu yang pemula, baik dengan latar belakang IT maupun non-IT, untuk menjadi seorang Software Engineer profesional dalam waktu 9 Minggu',
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
