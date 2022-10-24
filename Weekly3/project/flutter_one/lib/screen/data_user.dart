import 'package:flutter/material.dart';
import 'package:flutter_one/provider/user_provider.dart';
import 'package:provider/provider.dart';

class DataUser extends StatelessWidget {
  const DataUser({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Data User')),
      body: ListView.builder(
          itemCount: userProvider.user.length,
          itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                      child: Text(userProvider.user[index].name[0])),
                  title: Text(userProvider.user[index].email),
                  subtitle: Text(userProvider.user[index].msg),
                ),
              )),
    );
  }
}
