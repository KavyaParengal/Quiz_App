import 'package:flutter/material.dart';
import 'package:quiz_app/model/model.dart';
class Quiz_App extends StatefulWidget {
  const Quiz_App({Key? key}) : super(key: key);

  @override
  State<Quiz_App> createState() => _Quiz_AppState();
}

class _Quiz_AppState extends State<Quiz_App> {
  @override

  List? question=[
    Model(questions:'Australia is a country as well as a continent ',answer: true),
    Model(questions:'The national flag of America has 51 stars', answer:true),
    Model(questions:'Ears are responsible for smelling.',answer: false),
    Model(questions:'The human body consists of 150 bones.',answer: false),
    Model(questions:'A century consists of one hundred years.',answer :true),
    Model(questions:'The capital of Australia is Sydney.',answer:true),
    Model(questions:'China is the largest country in the world. ', answer:false),
    Model(questions:'Oxygen is required for breathing.',answer: true),
    Model(questions:'There is no railway system in Iceland.', answer:true),
    Model(questions:'The alphabest A, I, E,O,U are called consonants. ',answer: false)
  ];
  List<Icons> icon=[];

  int qnNum=0;
  String getQuestions(){
    return question?[qnNum].questions;
  }
  bool getAnswers(){
    return question?[qnNum].answer;
  }

  void getNextqn(){
    if(qnNum<question!.length){
      qnNum++;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 240),
              child: Text('The alphabest A, I, E,O,U are called consonants. ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.w600),),
            ),
            ElevatedButton(
                onPressed: (){},
                child: Text('True',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                fixedSize: Size(350, 55)
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){},
              child: Text('False',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[800],
                  fixedSize: Size(350, 55)
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: Row(
                children: [
                  Icon(Icons.check,color: Colors.green[800],size: 35,),

                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
