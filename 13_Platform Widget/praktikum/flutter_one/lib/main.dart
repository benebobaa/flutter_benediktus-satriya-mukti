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
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.menu),
        title: const Text(
          'Telegram',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 13),
            child: Icon(Icons.search),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/foto.png'), fit: BoxFit.cover),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: ExactAssetImage('assets/foto.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'beneboba',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        '0857223848',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            tile(msg: "New Group", icon: Icons.people),
            tile(msg: "New Seceret Chat", icon: Icons.lock),
            tile(msg: "New Channel", icon: Icons.campaign),
            const Divider(
              height: 25,
            ),
            tile(msg: "Contacts", icon: Icons.contact_mail),
            tile(msg: "Invite Friends", icon: Icons.people),
            tile(msg: "Settings", icon: Icons.settings),
            tile(msg: "Telegram FAQ", icon: Icons.question_mark),
          ],
        ),
      ),
      body: Column(
        children: [
          listChat(),
          listChat(),
          listChat(),
          listChat(),
          listChat(),
          listChat(),
          listChat()
        ],
      ),
    );
  }

  ListTile tile({String? msg, IconData? icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 18,
      ),
      title: Text(
        msg!,
        style: const TextStyle(
            color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w800),
      ),
    );
  }

  ListTile listChat() {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 15, left: 17),
      leading: const CircleAvatar(
        backgroundImage: ExactAssetImage('assets/foto.png'),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 14, left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Beneboba",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text(
              "2:00 pm",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 14, left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Halo ges",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            CircleAvatar(
              backgroundColor: Colors.green[200],
              radius: 10,
              child: const Text(
                "2",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
