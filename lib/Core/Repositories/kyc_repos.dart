import 'package:dio/dio.dart';

abstract class KycRepo {
  Future<Response?> uploadImage({required dynamic data, String? fileName});
}
