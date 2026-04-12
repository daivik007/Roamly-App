class Place {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String distanceKm;
  final String price;
  final bool isOpen;

  const Place({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.distanceKm,
    required this.price,
    required this.isOpen,
  });
}