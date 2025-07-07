class ServiceProvider {
  final String name;
  final String status;
  final String location;
  final double rating;
  final List<String> reviews;
  final String imagePath; // New

  ServiceProvider({
    required this.name,
    required this.status,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.imagePath, // New
  });
}
