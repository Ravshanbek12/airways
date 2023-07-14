class CroodModel {
  final double lon;
  final double lat;

  CroodModel({required this.lat, required this.lon});

  factory CroodModel.fromJson(Map<String, dynamic> json) {
    return CroodModel(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
