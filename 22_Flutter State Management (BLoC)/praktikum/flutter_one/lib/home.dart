import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_one/add_contact.dart';
import 'package:flutter_one/bloc/contact_bloc.dart';

class Home extends StatelessWidget {
  final bool data;
  const Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: (data)
          ? BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state is ContactInitial) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  );
                }
                if (state is ContactLoaded) {
                  return ListView.builder(
                      itemCount: state.contact.length,
                      itemBuilder: (context, index) {
                        final contact = state.contact[index];
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                child: const Icon(Icons.face_outlined),
                              ),
                              title: Text(contact.name),
                              subtitle: Text(contact.number),
                              trailing: const Icon(Icons.delete_forever_rounded),
                            ),
                          ),
                        );
                      });
                } else {
                  return const Text('Something wrong');
                }
              },
            )
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.people),
                    Text('Contact empty'),
                  ]),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddContacts()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
