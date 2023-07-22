import 'package:flutter/material.dart';
import 'package:quiz_app/model/model.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Model> question = [
    Model(questions: 'Australia is a country as well as a continent', answer: true),
    Model(questions: 'The national flag of America has 51 stars', answer: true),
    Model(questions: 'Ears are responsible for smelling.', answer: false),
    Model(questions: 'The human body consists of 150 bones.', answer: false),
    Model(questions: 'A century consists of one hundred years.', answer: true),
    Model(questions: 'The capital of Australia is Sydney.', answer: true),
    Model(questions: 'China is the largest country in the world.', answer: false),
    Model(questions: 'Oxygen is required for breathing.', answer: true),
    Model(questions: 'There is no railway system in Iceland.', answer: true),
    Model(questions: 'The alphabets A, I, E, O, U are called consonants.', answer: false),
  ];

  List<IconData> icon = [];
  int qnNum = 0;
  int count = 0;

  String getQuestions() {
    return question[qnNum].questions;
  }

  bool getAnswers() {
    return question[qnNum].answer;
  }

  void getNextQn() {
    if (qnNum < question!.length) {
      qnNum++;
    }
  }

  void clearQn() {
    count = 0;
    qnNum = 0;
    icon = [];
  }

  bool finishQn(){
    if(qnNum>=question!.length-1){
      return true;
    }
    else
      return false;
  }

  void ansQn(bool answer) {
    bool getAnswer = getAnswers();
    if (finishQn()==true) {
      if (count <= 5) {
        openAlertFail();
        clearQn();
      } else {
        openAlertWin();
        clearQn();
      }
    } else {
      if (getAnswer == answer) {
        icon.add(Icons.check);
        count++;
      } else {
        icon.add(Icons.close);
      }
      getNextQn();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 240),
              child: Text(
                getQuestions(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ansQn(true);
                });

              },
              child: Text(
                'True',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                fixedSize: Size(350, 55),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ansQn(false);
                });

              },
              child: Text(
                'False',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[800],
                fixedSize: Size(350, 55),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: [
                  for (var iconData in icon)
                    Icon(iconData, color: Colors.green[800], size: 35),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future openAlertWin() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Image.asset('images/win.jpg'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK', style: TextStyle(fontSize: 25)),
        ),
      ],
    ),
  );

  Future openAlertFail() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Image.asset('images/fail.jpg'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK', style: TextStyle(fontSize: 25)),
        ),
      ],
    ),
  );
}
