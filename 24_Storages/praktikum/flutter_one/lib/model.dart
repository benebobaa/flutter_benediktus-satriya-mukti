import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  String username = '';
  String email = '';
  String phone = '';
  String pw = '';

  Data(
      {required this.username,
      required this.email,
      required this.phone,
      required this.pw});
}

class User extends ChangeNotifier {
  Future login({required Data user}) async {
    final logindata = await SharedPreferences.getInstance();

    await logindata.setString('username', user.username);
    await logindata.setString('email', user.email);
    await logindata.setString('phone', user.phone);
    await logindata.setString('pw', user.pw);

    notifyListeners();
  }

  Future<Data> getData() async {
    final data = await SharedPreferences.getInstance();

    String username = data.getString('username')!;
    String email = data.getString('email')!;
    String phone = data.getString('phone')!;
    String pw = data.getString('pw')!;

    notifyListeners();

    return Data(username: username, email: email, phone: phone, pw: pw);
  }
}
