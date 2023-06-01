import 'package:flutter/material.dart';
import 'package:stour/util/const.dart';
import 'package:google_fonts/google_fonts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final List<int> _images = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _images.map((e) {
        return buildPost(context);
      }).toList(),
    );
  }

  Container buildPost(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        margin: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/236x/0a/b5/9e/0ab59e7c8e7a1213ff1ee891e98e06ae.jpg?nii=t"),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hato",
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 35, 52, 10),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "2 tháng trước",
                            style: GoogleFonts.roboto(
                              color: const Color.fromARGB(173, 35, 52, 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: "delete",
                          child: Text(
                            "Xóa Bài Viết",
                            style: GoogleFonts.roboto(
                              color: Constants.text,
                            ),
                            selectionColor:
                                const Color.fromARGB(255, 35, 52, 10),
                          ),
                        ),
                        PopupMenuItem(
                          value: "save",
                          child: Text(
                            "Lưu Bài Viết",
                            style: GoogleFonts.roboto(
                              color: Constants.text,
                            ),
                            selectionColor:
                                const Color.fromARGB(255, 35, 52, 10),
                          ),
                        ),
                      ];
                    },
                    child: Icon(
                      Icons.more_vert,
                      color: Constants.text,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Bảo tàng có kiến trúc rất độc đáo, nó khiến mình cảm thấy rất bất ngờ về sự hòa hợp giữa màu sắc phương đông và phương tây. Mình đặt biệt rất ấn tượng và thích cầu thang xoắn ốc, những tác phẩm được trưng bài cũng rất nghệ thuật và đậm chất văn hóa từng thời kỳ nữa. Tui chụp được quá trời hình ở đây luôn á :3",
                style: GoogleFonts.roboto(
                    fontSize: 18, color: const Color.fromARGB(255, 35, 52, 10)),
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                elevation: 0,
                semanticContainer: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  "assets/img/BaoTangMyThuat/Bao-tang-My-thuat-TP-HCM-ivivu.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(Icons.favorite_outline,
                            color: Color.fromARGB(255, 255, 12, 109)),
                        const SizedBox(width: 5),
                        Text(
                          "123",
                          style: GoogleFonts.roboto(
                            color: Constants.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.comment_outlined,
                            color: Constants.darkgreen),
                        const SizedBox(width: 5),
                        Text(
                          "123",
                          style: GoogleFonts.roboto(
                            color: Constants.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined, color: Constants.darkpp),
                        const SizedBox(width: 5),
                        Text(
                          "1",
                          style: GoogleFonts.roboto(
                            color: Constants.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
