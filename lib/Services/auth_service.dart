import 'package:http/http.dart' as http;

import '../Core/Apis/apis.dart';
import '../Core/Mixins/general_mixin.dart';
import '../Core/Repositories/auth_repo.dart';

///This AuthService class is a sample service class that mixes with the [GeneralMixin]
///mixin since Dart does not support multiple inheritance.
///
/// This class also implements all the methods listed in the [AuthRepo]. If any
/// method listed in the [AuthRepo] is missing from this class, it will be flagged
/// as an error and require you to implement it here.

class AuthService with GeneralMixin implements AuthRepo {
  @override
  Future<http.Response?> login({required Map data}) async {
    // TODO: implement login
    http.Response? res = await post(route: loginRoute, data: data);
    return res;
  }

  @override
  Future<http.Response?> signup({required Map data}) async {
    // TODO: implement signup
    http.Response? res = await post(route: signupRoute, data: data);
    return res;
  }
}
