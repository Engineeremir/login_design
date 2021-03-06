class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();
  ImageConstants._init();

  String get personProfile => toPng("person");

  String toPng(String name) => "assets/images/$name.png";
}
