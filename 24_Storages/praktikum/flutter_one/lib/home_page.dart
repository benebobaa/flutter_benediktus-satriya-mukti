import 'package:flutter/material.dart';
import 'package:flutter_one/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:flutter_one/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences logindata;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<Data?>(
          future: userProvider.getData(),
          builder: (context, snapshot) {
            Data? user = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello, ${user!.username}',
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(
                    user.email,
                    style: const TextStyle(fontSize: 40),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      logindata.setBool('login', true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
