import 'package:flutter/widgets.dart';
import 'package:flutter_one/model/user.dart';

class UserProvider with ChangeNotifier {
  final List<User> _user = [];

  List<User> get user => _user;

  void addUser(User user) {
    _user.add(user);
    notifyListeners();
  }
}
