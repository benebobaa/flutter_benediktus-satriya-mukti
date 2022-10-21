import 'package:flutter/cupertino.dart';
import 'package:flutter_one/models/api/contact_api.dart';
import 'package:flutter_one/models/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  getAllContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }

}
