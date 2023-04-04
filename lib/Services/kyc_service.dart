import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:paperless_listings/Core/Mixins/file_upload_mixin.dart';
import 'package:paperless_listings/Core/Repositories/kyc_repos.dart';

import '../Core/Apis/apis.dart';

class KycService with FileUploadMixin implements KycRepo {
  @override
  Future<Response?> uploadImage({required data, String? fileName}) async {
    // TODO: implement uploadImage
    Response? res;
    if (kIsWeb) {
      res = await postWebImage(
          route: uploadRoute, file: data, fileName: fileName!);
      return res;
    } else {
      res = await postImage(route: uploadRoute, file: data);
      return res;
    }
  }
}
