import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_one/model.dart';

class MyService {
  Future<Person?> fetchUsers() async {
    try {
      final response = await Dio().get('https://reqres.in/api/users');

      debugPrint(response.data.toString());

      return Person(data: response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future createUser({
    required String name,
    required String job,
  }) async {
    try {
      final response = await Dio().post('https://reqres.in/api/users', data: {
        'name': name,
        'job': job,
      });

      debugPrint(response.data.toString());

      return Person(data: response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future updateUser({required String name, required String job}) async {
    try {
      final response = await Dio().put(
        'https://reqres.in/api/users/3',
        data: {
          'name': name,
          'job': job,
        },
      );

      debugPrint(response.data.toString());

      return Person(data: response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser() async {
    try {
      final response = await Dio().delete('https://reqres.in/api/users/3');

      debugPrint(response.data.toString());

      return Person(data: response.data.toString());
    } catch (e) {
      rethrow;
    }
  }
}
