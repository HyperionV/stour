class Place {
  String id;
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

  Place({
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

class SavedTourClass {
  final List<List<Place>> addedPlaces;
  String name;
  final DateTime timeSaved;
  SavedTourClass({
    required this.addedPlaces,
    required this.name,
    required this.timeSaved,
  });
}

List<String> currentLocationDetail = [];

List<Place> places = [];
List<Place> food = [];
List<SavedTourClass> savedTour = [];
