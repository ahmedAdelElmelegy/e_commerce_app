class BannerModel {
  int? id;

  String? image;

  BannerModel(
    this.id,
    this.image,
  );
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      json['id'],
      json['image'],
    );
  }
}
