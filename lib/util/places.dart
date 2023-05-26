import 'dart:math';

class Place {
  final String id;
  final String name;
  final String address;
  final String rating;
  final String time;
  final String img;
  final int price;
  final String history;
  final double duration;

  const Place({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.time,
    required this.img,
    required this.price,
    required this.history,
    required this.duration,
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
    price: 10,
    history: '',
    duration: 2,
  ),
  Place(
    id: '',
    name: 'Bảo tàng Mỹ thuật Hồ Chí Minh',
    address:
        '97a Phó Đức Chính, Phường Nguyễn Thái Bình, Quận 1, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\Ben-trong-bao-tang-my-thuat-ho-chi-minh-co-gi.jpg',
    price: 10,
    history: '',
    duration: 2,
  ),
  Place(
    id: '',
    name: 'Dinh Độc Lập',
    address: '135 Nam Kỳ Khởi Nghĩa, Quận 1, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img:
        'assets\\dinh-doc-lap-bieu-tuong-mang-y-nghia-lich-su-sau-dam-cua-dan-toc-ta-avt.jpg',
    price: 10,
    history: '',
    duration: 2,
  ),
  Place(
    id: '',
    name: 'Đền Trần Hưng Đạo',
    address: '36 Võ Thị Sáu, phường 4, Quận 1,TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\R.jpg',
    price: 10,
    history: '',
    duration: 2,
  ),
  Place(
    id: '',
    name: 'Chợ nổi Cái Răng',
    address: 'số 46 đường Hai Bà Trưng, Quận Ninh Kiều,TP. Cần Thơ',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\20161031072908-cho-noi-cao-rang (10).jpg',
    price: 10,
    history: '',
    duration: 2,
  ),
  Place(
    id: '',
    name: 'Chùa Ông',
    address:
        'Số 32 đường Hai Bà Trưng, phường Tân An, Quận Ninh Kiều, TP. Cần Thơ',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\cantho6_umpf.jpg',
    price: 10,
    history: '',
    duration: 2,
  ),
  Place(
    id: '',
    name: 'Vườn Cò Bằng Lăng',
    address: 'Thới Bình 1, Phường Thuận An, Quận Thốt Nốt, TP. Cần Thơ',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\10-8.jpg',
    price: 5,
    history: '',
    duration: 2,
  ),
  Place(
    id: '',
    name: 'Đại học Quốc gia TP.HCM',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 10,
    history: '',
    duration: 2,
  ),
];

List<Place> food = [
  Place(
    id: '',
    name: 'Bún chả1',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  ),
  Place(
    id: '',
    name: 'Công viên tao đàn',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 0,
    history: '',
    duration: 1,
  ),
  Place(
    id: '',
    name: 'Bún chả3',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  ),
  Place(
    id: '',
    name: 'Bún chả4',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  ),
  Place(
    id: '',
    name: 'Bún chả5',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  ),
  Place(
    id: '',
    name: 'Bún chả6',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  ),
  Place(
    id: '',
    name: 'Bún chả7',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  ),
  Place(
    id: '',
    name: 'Bún chả8',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  ),
  Place(
    id: '',
    name: 'Bún chả9',
    address: 'Khu phố 6, phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh',
    rating: (Random().nextDouble() * 5).toStringAsFixed(1),
    time: '7-17',
    img: 'assets\\ky-tuc-xa-truong-dai-hoc-quoc-gia-tphcm.jpg',
    price: 5,
    history: '',
    duration: 0.5,
  )
];
