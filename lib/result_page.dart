import 'package:flutter/material.dart';
import 'reusable_card.dart';


const activeCardColor = Color(0xff00bf71);

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResults,required this.resultText,required this.interpretation});
  final String bmiResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff00BB6E),
        title: Text("BMI CALCULATOR"),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text("Your Result"
            ,style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color:Colors.white
              ),
            ),
          ),
          ),
          Expanded(flex: 5,
          child: ReusableCard(
            activeCardColor,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(resultText.toUpperCase(),
              style: TextStyle(
                fontSize: 25.0,
                color:Colors.red,
                fontWeight: FontWeight.bold
              ),),
              Text(bmiResults,
              style:TextStyle(
                fontSize: 80.0,
                color:Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
              Text(interpretation,
              textAlign: TextAlign.center,
              style:TextStyle(
                fontSize: 20.0,
                color:Colors.white
              ))
            ],)
          ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("Re Calculate",
              style:TextStyle(
                  fontSize: 20.0,
                  color:Colors.black54,
                  fontWeight: FontWeight.bold
              ),
              ),
              height: 70.0,
              width: double.infinity,
              color: Colors.white,
            ),
          )
        ],

      ),
    );
  }
}
