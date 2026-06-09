class NearbyStore {
  final String id;
  final String partnerName;
  final String storeName;
  final double? distance;
  final String? imageUrl;
  final String? coverImageUrl;
  final String? productImageUrl;
  final String? duration;

  const NearbyStore({
    required this.id,
    required this.partnerName,
    required this.storeName,
    this.distance,
    this.imageUrl,
    this.coverImageUrl,
    this.productImageUrl,
    this.duration,
  });

  factory NearbyStore.fromJson(Map<String, dynamic> json) {
    return NearbyStore(
      id: (json['id'] ?? '').toString(),
      partnerName: (json['partnerName'] ?? '').toString(),
      storeName: (json['storeName'] ?? '').toString(),
      distance: _toDoubleOrNull(json['distance']),
      imageUrl: json['imageUrl']?.toString(),
      coverImageUrl: json['coverImageUrl']?.toString(),
      productImageUrl: json['productImageUrl']?.toString(),
      duration: json['duration']?.toString(),
    );
  }

  static double? _toDoubleOrNull(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString());
  }
}
