// lib/models/hall_model.dart


class Hall {
  final String id;
  final String name;
  final String location;
  final String imagePath;
  final double price;
  final double rating;
  final int reviewCount;
  final String description;
  final List<Map<String, dynamic>> facilities; // <-- ADD THIS LINE

  Hall({
    required this.id,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.description = "A beautiful hall for all your events. "
        "Equipped with modern amenities and spacious interiors. "
        "Perfect for weddings, parties, and corporate events.",
    required this.facilities, // <-- ADD THIS LINE
  });
}