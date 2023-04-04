import 'package:http/http.dart' as http;
import 'package:paperless_listings/Core/Apis/apis.dart';
import 'package:paperless_listings/Core/Mixins/general_mixin.dart';
import 'package:paperless_listings/Core/Repositories/gallery_repo.dart';

class GalleryService with GeneralMixin implements GalleryRepo {
  @override
  Future<http.Response?> getGalleryImages() async {
    // TODO: implement getGalleryImages
    http.Response? res = await get(route: galleryRoute);
    return res;
  }
}
