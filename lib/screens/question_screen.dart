import 'package:flutter/material.dart';
import 'package:stour/screens/main_screen.dart';
import 'package:stour/util/const.dart';
import 'package:stour/util/question.dart';
import 'package:google_fonts/google_fonts.dart';

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
    setState(() {
      a == true ? validAnswer++ : 0;
      questionNumber == widget.listquestion.length - 1
          ? finished(validAnswer)
          : questionNumber++;
    });
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Constants.lightgreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(widget.listquestion[questionNumber].ques,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      )),
                ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 30),
                ),
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.orange;
                    }
                    return Colors.black;
                  },
                ),
              ),
              onPressed: () {
                increaseCount(widget.listquestion[questionNumber].answ == true
                    ? true
                    : false);
              },
              child: const Text('Đúng'),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.orange; // Màu đỏ khi nhấn
                    }
                    return Colors.black; // Màu mặc định khi không nhấn
                  },
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(fontSize: 30),
                ),
              ),
              onPressed: () {
                increaseCount(widget.listquestion[questionNumber].answ == false
                    ? true
                    : false);
              },
              child: const Text('Sai'),
            ),
          ))
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
        ? 'Thật tiếc bạn không có voucher từ Stour'
        : 'Chúc mừng bạn đã nhận được voucher';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kết quả',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Center(
              child: Text(
            'Đáp án chính xác !!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          const SizedBox(height: 20),
          Text(
            result.toString(),
            style: const TextStyle(
              fontSize: 40,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Center(
              child: Text(
            textRs,
            style: const TextStyle(
              fontSize: 20,
            ),
          )),
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
            child: const Text('Trở về trang chủ'),
          )
        ],
      ),
    );
  }
}
