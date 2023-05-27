import 'dart:math';

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

List<Place> placesTmp = [
  Place(
    id: '',
    name: 'Đại học Quốc gia TP.HCM',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    img: 'assets\\R.png',
    price: 10,
    history: '',
    duration: 2,
    openTime: 7,
    closeTime: 17,
    city: 'TP. Hồ Chí Minh',
    district: 'TP. Thủ Đức',
  ),
  Place(
    id: '',
    name: 'Bảo tàng Mỹ thuật Hồ Chí Minh',
    address:
        '97a Phó Đức Chính, Phường Nguyễn Thái Bình, Quận 1, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    img: 'assets\\Ben-trong-bao-tang-my-thuat-ho-chi-minh-co-gi.jpg',
    price: 10,
    history: '',
    duration: 2,
    city: "TP. Hồ Chí Minh",
    closeTime: 17,
    openTime: 7,
    district: "Quận 1",
  ),
  Place(
    id: '',
    name: 'Dinh Độc Lập',
    address: '135 Nam Kỳ Khởi Nghĩa, Quận 1, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    img:
        'assets\\dinh-doc-lap-bieu-tuong-mang-y-nghia-lich-su-sau-dam-cua-dan-toc-ta-avt.jpg',
    price: 10,
    history: '',
    duration: 2,
    city: "TP. Hồ Chí Minh",
    closeTime: 17,
    district: "Quận 1",
    openTime: 7,
  ),
  Place(
      id: '',
      name: 'Đền Trần Hưng Đạo',
      address: '36 Võ Thị Sáu, phường 4, Quận 1,TP. Hồ Chí Minh',
      rating: (Random().nextDouble() * 5).toStringAsFixed(1),
      img: 'assets\\R.jpg',
      price: 10,
      history: '',
      duration: 2,
      city: "TP. Hồ Chí Minh",
      closeTime: 17,
      district: 'Quận 1',
      openTime: 7),
  Place(
      id: '',
      name: 'Chợ nổi Cái Răng',
      address: 'số 46 đường Hai Bà Trưng, Quận Ninh Kiều,TP. Cần Thơ',
      rating: (Random().nextDouble() * 5).toStringAsFixed(1),
      img: 'assets\\20161031072908-cho-noi-cao-rang (10).jpg',
      price: 10,
      history: '',
      duration: 2,
      city: "TP. Cần Thơ",
      closeTime: 17,
      district: "Quận Ninh Kiều",
      openTime: 7),
  Place(
      id: '',
      name: 'Chùa Ông',
      address:
          'Số 32 đường Hai Bà Trưng, phường Tân An, Quận Ninh Kiều, TP. Cần Thơ',
      rating: (Random().nextDouble() * 5).toStringAsFixed(1),
      img: 'assets\\cantho6_umpf.jpg',
      price: 10,
      history: '',
      duration: 2,
      city: "TP Cần Thơ",
      closeTime: 17,
      district: "Quận Ninh Kiều",
      openTime: 7),
  Place(
      id: '',
      name: 'Vườn Cò Bằng Lăng',
      address: 'Thới Bình 1, Phường Thuận An, Quận Thốt Nốt, TP. Cần Thơ',
      rating: (Random().nextDouble() * 5).toStringAsFixed(1),
      img: 'assets\\10-8.jpg',
      price: 5,
      history: '',
      duration: 2,
      city: "TP. Cần Thơ",
      closeTime: 17,
      district: "Quận Thốt Nốt",
      openTime: 7),
];

List<Place> foodTmp = [
  const Place(
    id: '1',
    name: 'Tasty Burgers',
    address: '123 Main St',
    rating: '4.5',
    img: 'https://example.com/burgers.jpg',
    price: 12,
    history:
        'Tasty Burgers is a popular burger joint known for its juicy burgers and crispy fries.',
    duration: 1.5,
    openTime: 10.0,
    closeTime: 22.0,
    district: 'Downtown',
    city: 'New York',
  ),
  const Place(
    id: '2',
    name: 'Pizza Palace',
    address: '456 Elm St',
    rating: '4.8',
    img: 'https://example.com/pizza.jpg',
    price: 15,
    history:
        'Pizza Palace is a family-owned pizzeria that has been serving delicious pizza for over 30 years.',
    duration: 1.5,
    openTime: 9.0,
    closeTime: 17.0,
    district: 'Uptown',
    city: 'Chicago',
  ),
  const Place(
    id: '3',
    name: 'Sushi Spot',
    address: '789 Ocean Blvd',
    rating: '4.7',
    img: 'https://example.com/sushi.jpg',
    price: 20,
    history:
        'Sushi Spot is a trendy Japanese restaurant that offers a wide variety of sushi rolls and other dishes.',
    duration: 1.5,
    openTime: 11.0,
    closeTime: 23.0,
    district: 'Coastal',
    city: 'Los Angeles',
  ),
  const Place(
    id: '4',
    name: 'BBQ House',
    address: '555 Main St',
    rating: '4.4',
    img: 'https://example.com/bbq.jpg',
    price: 25,
    history:
        'BBQ House is a popular restaurant that specializes in slow-cooked meats and homemade BBQ sauce.',
    duration: 2.0,
    openTime: 10.0,
    closeTime: 21.0,
    district: 'Downtown',
    city: 'Miami',
  ),
  const Place(
    id: '5',
    name: 'Mexican Kitchen',
    address: '1600 Pennsylvania Ave NW',
    rating: '4.5',
    img: 'https://example.com/mexican.jpg',
    price: 18,
    history:
        'Mexican Kitchen is a lively restaurant that serves authentic Mexican dishes and refreshing margaritas.',
    duration: 2.0,
    openTime: 12.0,
    closeTime: 22.0,
    district: 'National Mall',
    city: 'Washington D.C.',
  ),
  const Place(
    id: '6',
    name: 'Thai Taste',
    address: '321 Forest Ave',
    rating: '4.6',
    img: 'https://example.com/thai.jpg',
    price: 17,
    history:
        'Thai Taste is a cozy restaurant that offers a variety of Thai dishes, including spicy curries and noodle soups.',
    duration: 1.5,
    openTime: 10.0,
    closeTime: 18.0,
    district: 'Suburban',
    city: 'Atlanta',
  ),
  const Place(
    id: '7',
    name: 'Bakery Bliss',
    address: '555 Bakery St',
    rating: '4.2',
    img: 'https://example.com/bakery.jpg',
    price: 7,
    history:
        'Bakery Bliss is a charming bakery that specializes in homemade pastries, breads, and cakes.',
    duration: 1.0,
    openTime: 8.0,
    closeTime: 20.0,
    district: 'Downtown',
    city: 'Seattle',
  ),
  const Place(
    id: '8',
    name: 'Seafood Shack',
    address: '777.9',
    img: 'https://example.com/seafood.jpg',
    price: 30,
    history:
        'Seafood Shack is a casual restaurant that serves fresh seafood dishes, including crab cakes and grilled fish.',
    duration: 2.0,
    openTime: 11.0,
    closeTime: 23.0,
    district: 'Coastal',
    city: 'San Francisco',
    rating: '3.6',
  ),
  const Place(
    id: '9',
    name: 'Gourmet Deli',
    address: '432 Deli Rd',
    rating: '4.7',
    img: 'https://example.com/deli.jpg',
    price: 14,
    history:
        'Gourmet Deli is a popular spot for sandwiches and salads made with high-quality ingredients.',
    duration: 1.5,
    openTime: 9.0,
    closeTime: 19.0,
    district: 'Uptown',
    city: 'Boston',
  ),
  const Place(
    id: '10',
    name: 'Café Culture',
    address: '999 Café St',
    rating: '4.3',
    img: 'https://example.com/cafe.jpg',
    price: 10,
    history:
        'Café Culture is a cozy café that serves specialty coffee drinks, pastries, and light meals.',
    duration: 1.0,
    openTime: 7.0,
    closeTime: 19.0,
    district: 'Suburban',
    city: 'Dallas',
  ),
];
