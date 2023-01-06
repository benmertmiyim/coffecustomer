class BannerModel {
  final String bannerId;
  final String bannerURL;

  BannerModel({
    required this.bannerId,
    required this.bannerURL,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      bannerId: map['bannerId'] as String,
      bannerURL: map['bannerURL'] as String,
    );
  }
}
