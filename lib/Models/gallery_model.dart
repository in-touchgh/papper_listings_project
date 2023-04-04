class GalleryModel {
  final String url;
  final double? width;
  final double? height;

  GalleryModel({
    required this.url,
    this.width,
    this.height,
  });

  factory GalleryModel.fromJson(Map data) {
    return GalleryModel(
      url: data['url'],
      width:
          data['width'] == null ? null : double.parse(data['width'].toString()),
      height: data['height'] == null
          ? null
          : double.parse(data['height'].toString()),
    );
  }
}
