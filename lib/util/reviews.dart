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
  const Reviews(
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
  const Reviews(
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
  const Reviews(
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
  const Reviews(
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
];
