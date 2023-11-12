import 'package:flutter/material.dart';
import '../model/user.dart';
import '../model/api_service.dart';

class LoginViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();

  String username = '';
  String password = '';

  Future<bool> login() async {
    User user = User(username: username, password: password);
    var response = await apiService.login(user);
    return response['success'] == true;
  }
}
