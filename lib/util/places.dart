import 'dart:math';

class Place {
  final String id;
  final String name;
  final String address;
  final String rating;
  final String time;
  final String img;
  // final String history;
  // final String culture;

  const Place({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.time,
    required this.img,
  });
}

List<Place> placesTmp = [];

List<Place> places = [
  Place(
    id: '',
    name: 'Đại học Quốc gia TP.HCM',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\R.png',
  ),
  Place(
    id: '',
    name: 'Bảo tàng Mỹ thuật Hồ Chí Minh',
    address:
        '97a Phó Đức Chính, Phường Nguyễn Thái Bình, Quận 1, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\Ben-trong-bao-tang-my-thuat-ho-chi-minh-co-gi.jpg',
  ),
  Place(
    id: '',
    name: 'Dinh Độc Lập',
    address: '135 Nam Kỳ Khởi Nghĩa, Quận 1, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img:
        'assets\\dinh-doc-lap-bieu-tuong-mang-y-nghia-lich-su-sau-dam-cua-dan-toc-ta-avt.jpg',
  ),
  Place(
    id: '',
    name: 'Đền Trần Hưng Đạo',
    address: '36 Võ Thị Sáu, phường 4, Quận 1,TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\R.jpg',
  ),
  Place(
    id: '',
    name: 'Chợ nổi Cái Răng',
    address: 'số 46 đường Hai Bà Trưng, Quận Ninh Kiều,TP. Cần Thơ',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\20161031072908-cho-noi-cao-rang (10).jpg',
  ),
  Place(
    id: '',
    name: 'Chùa Ông',
    address:
        'Số 32 đường Hai Bà Trưng, phường Tân An, Quận Ninh Kiều, TP. Cần Thơ',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\cantho6_umpf.jpg',
  ),
  Place(
    id: '',
    name: 'Vườn Cò Bằng Lăng',
    address: 'Thới Bình 1, Phường Thuận An, Quận Thốt Nốt, TP. Cần Thơ',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\10-8.jpg',
  ),
  Place(
    id: '',
    name: 'Đại học Quốc gia TP.HCM',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
  ),
];

// List places = [
//   {
//     "img": "assets\\R.png",
//     "title": "Đại học Quốc gia TP.HCM",
//     "address": "Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh",
//     "rating": "4.5",
//     "time": "7-17",
//   },
//   {
//     "img": "assets\\Ben-trong-bao-tang-my-thuat-ho-chi-minh-co-gi.jpg",
//     "title": "Bảo tàng Mỹ thuật Hồ Chí Minh",
//     "address":
//         "97a Phó Đức Chính, Phường Nguyễn Thái Bình, Quận 1, TP. Hồ Chí Minh",
//     "rating": "4.5",
//     "time": "7-17",
//   },
//   {
//     "img":
//         "assets\\dinh-doc-lap-bieu-tuong-mang-y-nghia-lich-su-sau-dam-cua-dan-toc-ta-avt.jpg",
//     "title": "Dinh Độc Lập",
//     "address": "135 Nam Kỳ Khởi Nghĩa, Quận 1, TP. Hồ Chí Minh",
//     "rating": "4.5",
//     "time": "7-17",
//   },
//   {
//     "img": "assets\\R.jpg",
//     "title": "Đền Trần Hưng Đạo",
//     "address": "36 Võ Thị Sáu, phường 4, Quận 1,TP. Hồ Chí Minh",
//     "rating": "4.5",
//     "time": "7-17",
//   },
//   {
//     "img": "assets\\20161031072908-cho-noi-cao-rang (10).jpg",
//     "title": "Chợ nổi Cái Răng",
//     "address": "số 46 đường Hai Bà Trưng, Quận Ninh Kiều,TP. Cần Thơ",
//     "rating": "4.5",
//     "time": "7-17",
//   },
//   {
//     "img": "assets\\cantho6_umpf.jpg",
//     "title": "Chùa Ông",
//     "address":
//         "Số 32 đường Hai Bà Trưng, phường Tân An, Quận Ninh Kiều, TP. Cần Thơ",
//     "rating": "4.5",
//     "time": "7-17",
//   },
//   {
//     "img": "assets\\10-8.jpg",
//     "title": "Vườn Cò Bằng Lăng",
//     "address": "Thới Bình 1, Phường Thuận An, Quận Thốt Nốt, TP. Cần Thơ",
//     "rating": "4.5",
//     "time": "7-17",
//   },
//   {
//     "img": "assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg",
//     "title": "Kí túc xá Khu B",
//     "address": "Dĩ An, Bình Dương",
//     "rating": "4.5",
//     "time": "7-17",
//   }
// ];

List<Place> food = List<Place>.of(places);
