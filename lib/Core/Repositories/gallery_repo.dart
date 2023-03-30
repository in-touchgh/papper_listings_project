import 'package:http/http.dart' as http;

abstract class GalleryRepo {
  Future<http.Response?> getGalleryImages();
}
