import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Services/auth_service.dart';

///Providers are used to manage the state of the application
///
/// This AuthProvider is used to manage state and routing after authentication
/// events such as login and signup based on responses from the [AuthService]
///
/// The state management package to used is dependent on the developer. Examples include
/// Provider and Riverpod.
///
//Example using provider
class AuthProvider1 extends ChangeNotifier {
  AuthService authService = AuthService();

  String? _name;
  String? _email;
  String? _password;

  bool _loading = false;

  String? get name => _name;
  String? get email => _email;
  String? get password => _password;

  bool get loading => _loading;

  setName(value) {
    _name = value;
    notifyListeners();
  }

  setEmail(value) {
    _email = value;
    notifyListeners();
  }

  setPassword(value) {
    _password = value;
    notifyListeners();
  }

  login() async {
    _loading = true;
    Map data = {'email': _email, 'password': _password};
    http.Response? res = await authService.login(data: data);
    _loading = false;

    if (res != null) {
      //TODO: Handle response here to route user and store token and user data
      if (res.statusCode == 200) {
      } else {
        //TODO: Handle errors here including displaying dialogs
      }
    }
  }

  signup() async {
    _loading = true;
    Map data = {'name': _name, 'email': _email, 'password': _password};

    http.Response? res = await authService.signup(data: data);
    _loading = false;

    if (res != null) {
      //TODO: Handle response here to route user and store token and user data
      if (res.statusCode == 200) {
      } else {
        //TODO: Handle errors here including displaying dialogs
      }
    }
  }
}
