class Reviews {
  final String id;
  final String user;
  final String userImg;
  final String name;
  final String idLocation;
  final String content;
  final String score;
  final String createdAt;
  final String updatedAt;

  const Reviews({
    required this.id,
    required this.user,
    required this.userImg,
    required this.name,
    required this.idLocation,
    required this.content,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
  });
}

List<Reviews> user = [
  Reviews(
      id: "review1",
      user: "lnt",
      userImg: "unknown",
      name: "Lê Ngọc Thảo",
      idLocation: "place3",
      content:
          "Khung cảnh rất đẹp và trong lành. Những hiện vật được trưng bày giúp tui hiểu rõ hơn về bối cảnh lịch sử thời điểm tháng 4 năm ấy",
      score: "4.5",
      createdAt: "2022-03-15T15:00:00.000",
      updatedAt: ""),
  Reviews(
      id: "review2",
      user: "vtk",
      userImg: "unknown",
      name: "Văn Tuấn Kiệt",
      idLocation: "place8",
      content:
          "Kiến trúc nơi đây thật sự rất đẹp. Nó giữ được những nét cổ kính của riêng mình. Tôi thật sự rất thích nơi đây",
      score: "5.0",
      createdAt: "2023-05-20T08:00:00.000",
      updatedAt: ""),
  Reviews(
      id: "review3",
      user: "vmk",
      userImg: "unknown",
      name: "Võ Minh Khôi",
      idLocation: "place14",
      content:
          "Kiến trúc ở đây quả thật rất đẹp và cổ kính. Không gian bên trong cũng rất trang nghiêm",
      score: "4.0",
      createdAt: "2022-09-20T09:35:00.000",
      updatedAt: ""),
  Reviews(
      id: "review4",
      user: "nva",
      userImg: "unknown",
      name: "Nguyễn Văn A",
      idLocation: "food2",
      content:
          "Cà phê ở đây thực sự rất ngon, nó giữ được những hương vị đậm đà của cà phê rang xay thủ công. Nó làm dậy lên vị cà phê thơm mà tui luôn tìm kiếm ở một ly cà phê ngon",
      score: "5.0",
      createdAt: "2023-05-25T07:00:00.000",
      updatedAt: ""),
  // Reviews(
  //     id: "review5",
  //     user: "vtt",
  //     userImg: "unknown",
  //     name: "Võ Thanh Trúc",
  //     idLocation: "food3",
  //     content:
  //         "Bánh mì ở đây rất ngon và đầy đặn. Nhưng với tôi nó hơi đắt, tui nghĩ sẽ ăn một vài lần thôi chứ không thường xuyên",
  //     score: "3.5",
  //     createdAt: "2023-03-19T08:25:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review6",
  //     user: "lta",
  //     userImg: "unknown",
  //     name: "Lê Thị Anh",
  //     idLocation: "place5",
  //     content:
  //         "Cách bán hàng nơi đây thật độc đáo! Đi trên sông nước, ngắm nhìn quang cảnh, ăn một bữa sáng nóng hổi, nhâm nhi ly cà phê và có thể mua những món hàng mình thích. Thật tuyệt",
  //     score: "4.5",
  //     createdAt: "2023-03-25T05:30:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review7",
  //     user: "lta1",
  //     userImg: "unknown",
  //     name: "Lê Trúc Anh",
  //     idLocation: "place10",
  //     content: "Phòng trưng bày rất dễ nhìn, thu hút. Rất tuyệt!",
  //     score: "4.0",
  //     createdAt: "2023-04-16T09:30:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review8",
  //     user: "vtk",
  //     userImg: "unknown",
  //     name: "Văn Tuấn Kiệt",
  //     idLocation: "food1",
  //     content:
  //         "Món bánh xèo thịt vịt ở đây rất mới lạ. Mà cái vỏ nó hỏng có giòn lắm nghe. Nên thôi, ăn cho biết thôi bà con",
  //     score: "3.0",
  //     createdAt: "2023-03-15T16:00:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review9",
  //     user: "vtk",
  //     userImg: "unknown",
  //     name: "Văn Tuấn Kiệt",
  //     idLocation: "place9",
  //     content:
  //         "Không gian ở đây thật trang nghiêm, nó làm cho tâm tui được nhẹ nhàng",
  //     score: "5.0",
  //     createdAt: "2023-05-15T10:00:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review10",
  //     user: "vmk",
  //     userImg: "unknown",
  //     name: "Võ Minh Khôi",
  //     idLocation: "place8",
  //     content:
  //         "Tui thấy nó cũng bình thường, được cái kiến trúc rất đẹp. Nên đi nghen quý dị",
  //     score: "4.0",
  //     createdAt: "2022-02-22T09:50:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review11",
  //     user: "nnt",
  //     userImg: "unknown",
  //     name: "Nguyễn Ngọc Thức",
  //     idLocation: "place17",
  //     content:
  //         "Quao! Lâu lăm mới thấy lại kiểu kiến trúc này. Đẹp thật, thích quá đi mất",
  //     score: "4.5",
  //     createdAt: "2023-05-15T08:36:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review12",
  //     user: "lnt",
  //     userImg: "unknown",
  //     name: "Lê Ngọc Thảo",
  //     idLocation: "place6",
  //     content: "Không gian nơi đây thật trang nghiêm",
  //     score: "5.0",
  //     createdAt: "2023-05-26T09:21:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review13",
  //     user: "lta1",
  //     userImg: "unknown",
  //     name: "Lê Trúc Anh",
  //     idLocation: "food4",
  //     content: "Oi Cà phê ở đây đúng gu tui luôn, thơm ngon ghê",
  //     score: "4.0",
  //     createdAt: "2023-05-30T07:00:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review14",
  //     user: "vtn",
  //     userImg: "unknown",
  //     name: "Văn Tú Nguyệt",
  //     idLocation: "place18",
  //     content:
  //         "Ghế ngồi ở đây xịn ghê, chất lượng âm than cũng rất tốt. Không khí siêu thoáng mát luôn á. Mười đỉm nhe",
  //     score: "5.0",
  //     createdAt: "2022-11-20T17:00:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review15",
  //     user: "vtn",
  //     userImg: "unknown",
  //     name: "Văn Tú Nguyệt",
  //     idLocation: "food4",
  //     content: "Cà phê chỗ này ngon quá nè. Thơm ghê luôn á",
  //     score: "4.0",
  //     createdAt: "2023-01-20T06:30:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review16",
  //     user: "nnt",
  //     userImg: "unknown",
  //     name: "Nguyễn Ngọc Thức",
  //     idLocation: "food5",
  //     content:
  //         "chè ngon lắm mọi người ơi. Bùi bùi, béo béo, không quá ngọt nữa. Tui thích lắm. Với lại nó tốt cho sức khỏe nữa. Mọi người nên thử nhe",
  //     score: "5.0",
  //     createdAt: "2023-05-16T08:34:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review17",
  //     user: "vtk",
  //     userImg: "unknown",
  //     name: "Văn Tuấn Kiệt",
  //     idLocation: "place2",
  //     content:
  //         "Những tác phẩm được trưng bày thực sự rất đẹp mắt. Hướng dẫn viên cũng rất nhiệt tình nữa. Đáng để đi nha mn!!!",
  //     score: "5.0",
  //     createdAt: "2023-05-17T09:34:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review18",
  //     user: "vmk",
  //     userImg: "unknown",
  //     name: "Võ Minh Khôi",
  //     idLocation: "place22",
  //     content:
  //         "Dừa ở đây ngon ngọt lắm, giá cả cũng hợp lí. mà đợi xuồng chèo lâu quá, trừ bớt 1 sao",
  //     score: "4.0",
  //     createdAt: "2023-05-18T14:48:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review19",
  //     user: "lmq",
  //     userImg: "unknown",
  //     name: "Lê Minh Quang",
  //     idLocation: "place19",
  //     content:
  //         "Không gian thật choáng ngợp. Những vật được trưng bày quá thực rất giá trị. Người thuyết trình cũng rất tận tâm. Một chuyến tham quan hữu ích",
  //     score: "5.0",
  //     createdAt: "2023-05-19T08:34:00.000",
  //     updatedAt: ""),
  // Reviews(
  //     id: "review20",
  //     user: "vtt",
  //     userImg: "unknown",
  //     name: "Võ Thanh Trúc",
  //     idLocation: "place16",
  //     content:
  //         "Lối kiến trúc độc đáo là 10 điểm rồi nè. Thêm cái không khí rất trang nghiêm luôn. Là một nơi để mọi người có thể bày tỏ sự biết ơn của mình đối với Quốc tổ",
  //     score: "5.0",
  //     createdAt: "2023-05-20T08:34:00.000",
  //     updatedAt: "")
];
