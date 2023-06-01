import 'package:flutter/material.dart';
import 'package:stour/screens/main_screen.dart';
import 'package:stour/util/question.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stour/util/const.dart';

class QuestionScreen extends StatefulWidget {
  final List<Question> listquestion;
  const QuestionScreen({super.key, required this.listquestion});
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionNumber = 0;
  int validAnswer = 0;
  void increaseCount(bool a) {
    setState(
      () {
        a == true ? validAnswer++ : 0;
        questionNumber == widget.listquestion.length - 1
            ? finished(validAnswer)
            : questionNumber++;
      },
    );
  }

  void finished(int result) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return _QuestionResult(
              result: result,
              valiResult: widget.listquestion.length - 1,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    int count = questionNumber + 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Câu hỏi số: ${count.toString()}/${widget.listquestion.length.toString()}',
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 35, 52, 10),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 35, 52, 10)), // Change the color here
          onPressed: () {
            // Handle back button logic
            Navigator.pop(context);
          },
        ),
        backgroundColor: Constants.lightgreen,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                width: double.maxFinite,
                height: 250,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.listquestion[questionNumber].ques,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(fontSize: 20),
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.orange;
                          }
                          return Colors.black;
                        },
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.lightgreen),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(120, 50)),
                    ),
                    onPressed: () {
                      increaseCount(
                          widget.listquestion[questionNumber].answ == true
                              ? true
                              : false);
                    },
                    child: const Text('Đúng'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.orange; // Màu đỏ khi nhấn
                          }
                          return Colors.black; // Màu mặc định khi không nhấn
                        },
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.lightgreen),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(fontSize: 20),
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(120, 50)),
                    ),
                    onPressed: () {
                      increaseCount(
                          widget.listquestion[questionNumber].answ == false
                              ? true
                              : false);
                    },
                    child: const Text('Sai'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _QuestionResult extends StatelessWidget {
  final int result;
  final int valiResult;
  const _QuestionResult({required this.result, required this.valiResult});
  @override
  Widget build(context) {
    String textRs = result < (valiResult)
        ? 'Rất tiếc bạn đã không nhận được voucher từ STour trong lần chơi này!'
        : 'Bạn đã xuất sắc trả lời chính xác các câu hỏi của STour! Hãy nhận phần quà của STour là một voucher nhé!';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kết quả',
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 35, 52, 10),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 35, 52, 10)), // Change the color here
          onPressed: () {
            // Handle back button logic
            Navigator.pop(context);
          },
        ),
        backgroundColor: Constants.lightgreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'KẾT QUẢ',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 45),
            Text(
              'Số câu trả lời đúng: $result',
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 49, 177, 107),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                textRs,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 80),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const MainScreen();
                    },
                  ),
                );
              },
              child: Text(
                'Trở về trang chủ',
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
