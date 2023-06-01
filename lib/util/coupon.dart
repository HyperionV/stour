import 'package:stour/util/question.dart';

class Coupon {
  final int avaiable;
  final String couponId;
  final int discount;
  final String endDate;
  final String startDate;
  final String name;
  final List<Question> listQuestion;
  Coupon({
    required this.avaiable,
    required this.couponId,
    required this.discount,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.listQuestion,
  });
}

List<Coupon> listCoupon = [
  Coupon(
    avaiable: 3,
    couponId: 'couponId1',
    discount: 5,
    name: 'Mã giảm giá 5%',
    startDate: 'startDate',
    endDate: 'endDate',
    listQuestion: [
      Question(ques: 'Dinh Độc lập nằm ở Quận 1 ?', answ: true),
      Question(
          ques: 'Bánh xèo có nguồn gốc từ tỉnh Quảng Trị của nước ta ?',
          answ: false),
      Question(
          ques: 'Dân tộc Hoa là dân tộc tạo ra món Chè mè đen ?', answ: true),
    ],
  ),
  Coupon(
    avaiable: 100,
    couponId: 'couponId2',
    discount: 10,
    name: 'Mã giảm giá 10%',
    startDate: 'startDate',
    endDate: 'endDate',
    listQuestion: [
      Question(
          ques: 'Nhà hát Thành phố Hồ Chí Minh được xây dựng vào năm 1897 ?',
          answ: true),
      Question(
          ques: 'Đền trần hưng đạo nằm ở tỉnh Thừa Thiên Huế  ?', answ: false),
      Question(
          ques: 'Bưu điện trung tâm TPHCM nằm ở trung tâm thành phố ?',
          answ: true),
      Question(
          ques: 'Chùa Ông là một ngôi chùa nổi tiếng tại TPHCM ?', answ: true),
    ],
  ),
  Coupon(
    avaiable: 100,
    couponId: 'couponId3',
    discount: 10,
    name: 'Mã giảm giá 15%',
    startDate: 'startDate',
    endDate: 'endDate',
    listQuestion: [
      Question(
          ques:
              'Chùa Ông có liên quan đến nguồn gốc và phát triển của đạo Phật tại Việt Nam? ?',
          answ: true),
      Question(
          ques:
              'Bánh mì Huỳnh Hoa là tiệm bánh mì thuộc hàng lâu đời nhất Sài Gòn, tận 10 năm lịch sử?',
          answ: false),
      Question(
          ques:
              'Chợ nổi Cái Răng là biểu tưởng văn hóa  của vùng đồng bằng Sông Hồng?',
          answ: false),
      Question(
          ques:
              'Đình Thạnh Hòa được hình thành từ những năm giữa thế kỉ XIX đầu thế kỉ XX ?',
          answ: true),
      Question(
          ques:
              'Khu tưởng niệm Thủ Khoa Bùi Hữu Nghĩa nằm tọa lạc ở thành phố Hồ Chí Minh ?',
          answ: false),
      Question(
          ques:
              'Cà phê bệt sở dĩ có cái tên vậy là vì hình thức uống cà phê, không bàn ghế có đúng không ?',
          answ: true),
      Question(
          ques:
              'Một công trình được xây dựng từ năm 1886 đến năm 1891 nằm ở trung tâm thành phố Hồ Chí Minh, đó là Bảo Tàng Mỹ Thuật Hồ Chí Minh ?',
          answ: false),
    ],
  ),
];
