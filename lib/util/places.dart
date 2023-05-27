class Place {
  final String id;
  final String name;
  final String address;
  final String rating;
  final String img;
  final num price;
  final String history;
  final num duration;
  final num openTime;
  final num closeTime;
  final String district;
  final String city;

  const Place({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.img,
    required this.price,
    required this.history,
    required this.duration,
    required this.district,
    required this.city,
    required this.openTime,
    required this.closeTime,
  });
}

List<String> currentLocationDetail = [];

List<Place> places = [];
List<Place> food = [];
