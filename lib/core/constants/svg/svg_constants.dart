class SvgConstants {
  static SvgConstants? _instance;
  static SvgConstants get instance => _instance ??= SvgConstants._init();
  SvgConstants._init();

  String get art => toSvg("art");
  String get businesswoman => toSvg("businesswoman");
  String get influencer => toSvg("influencer");
  String get sunnyday => toSvg("sunnyday");

  String toSvg(String name) => "assets/svg/$name.svg";
}
