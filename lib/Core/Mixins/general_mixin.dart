import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Utils/dialog_utils.dart';
import '../../Utils/print_utils.dart';
import '../Box/box_manager.dart';

///This is where we specify all the http verbs that will be used in the app.
///

mixin GeneralMixin {
  BoxManager boxManager = BoxManager();

  //set request headers
  Map<String, String> setHeaders() {
    String? token = boxManager.getToken();
    return {
      'Content-Type': "application/json",
      'accept': "*/*",
      'x-access-token': token ?? ''
    };
  }

  ///The [post] method handles all POST requests and returns a response if no error
  ///occurred else returns null. It takes two arguments; api route and request body
  ///
  Future<http.Response?> post(
      {required String route, required Map data}) async {
    Map<String, String> headers = setHeaders();
    try {
      http.Response res = await http
          .post(
            Uri.parse(route),
            body: jsonEncode(data),
            headers: headers,
          )
          .timeout(
            const Duration(seconds: 60),
          );
      return res;
    } on TimeoutException {
      //handle timeout
      // throw ('Connection timed out');
      DialogUtils.errorDialog(
        title: 'Error',
        content: 'Connection timed out',
      );
    } catch (error) {
      //handle other exception
      PrintUtils.errorDebugPrint(error.toString());
      return null;
    }
  }

  ///The [get] method handles all GET requests and return response if no error
  ///occurred else return null. Takes one argument; api route
  ///
  Future<http.Response?> get({required String route}) async {
    Map<String, String> headers = setHeaders();
    try {
      http.Response res = await http
          .get(
            Uri.parse(route),
            headers: headers,
          )
          .timeout(
            const Duration(seconds: 60),
          );
      return res;
    } on TimeoutException {
      //handle timeout
      throw ('Connection timed out');
    } catch (error) {
      //handle other exception
      return null;
    }
  }

  ///The [put] method handles all PUT requests and return response if no error
  ///occurred else return null. It takes two arguments; api route and request body
  ///
  Future<http.Response?> put({required String route, required Map data}) async {
    Map<String, String> headers = setHeaders();
    try {
      http.Response res = await http
          .put(
            Uri.parse(route),
            body: data,
            headers: headers,
          )
          .timeout(
            const Duration(seconds: 60),
          );
      return res;
    } on TimeoutException {
      //handle timeout
      throw ('Connection timed out');
    } catch (error) {
      //handle other exception
      return null;
    }
  }

  ///The [patch] method handles all PATCH requests and return response if no error
  ///occurred else returns null. It takes two arguments; api route and request body
  ///
  Future<http.Response?> patch(
      {required String route, required Map data}) async {
    Map<String, String> headers = setHeaders();
    try {
      http.Response res = await http
          .patch(
            Uri.parse(route),
            body: data,
            headers: headers,
          )
          .timeout(
            const Duration(seconds: 60),
          );
      return res;
    } on TimeoutException {
      //handle timeout
      throw ('Connection timed out');
    } catch (error) {
      //handle other exception
      return null;
    }
  }

  ///The [delete] method handles all DELETE requests and return response if no error
  ///occurred else returns null. It takes two arguments; api route and request body
  ///
  Future<http.Response?> delete(
      {required String route, required Map data}) async {
    Map<String, String> headers = setHeaders();
    try {
      http.Response res = await http
          .delete(
            Uri.parse(route),
            body: data,
            headers: headers,
          )
          .timeout(
            const Duration(seconds: 60),
          );
      return res;
    } on TimeoutException {
      //handle timeout
      throw ('Connection timed out');
    } catch (error) {
      //handle other exception
      return null;
    }
  }
}
