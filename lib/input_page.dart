import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'brain.dart';

const activeCardColor = Color(0xff00bf71);
const inactiveCardColor=Color(0xff009f5e);

enum Gender{
  male,
  female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height=180;
  int weight=60;
  int age=18;


  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;

  void updateColor(int gender){
    if(gender==1){
      if(maleCardColor==inactiveCardColor){
        maleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor;
      }
      else{
        maleCardColor=inactiveCardColor;
      }
    }
    if(gender==2){
      if(femaleCardColor==inactiveCardColor){
        femaleCardColor=activeCardColor;
        maleCardColor=inactiveCardColor;
      }
      else{
        femaleCardColor=inactiveCardColor;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00BB6E),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(1);
                  });
                },
                child: ReusableCard(maleCardColor,
                    IconContent(icon: Icons.male,label:"Male")),
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColor(2);
                  });
                },
                child: ReusableCard(femaleCardColor,IconContent(icon: Icons.female,label:"Female"),
                ),
              ),
              )
            ],
          ),
          ),
          Expanded(child: Row(
            children:  [//second level card
              Expanded(child: ReusableCard(inactiveCardColor,Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children:<Widget> [
                  Text("HEIGHT",
                  style:TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,

                  ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                      style:TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )),
                      Text("cm",
                          style:TextStyle(
                              fontSize: 15.0,
                              color: Colors.white
                          ))
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0
                      ),overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)

                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min:120.0,
                      max: 220.0,
                      activeColor:Colors.yellow,
                      inactiveColor: Colors.white,
                      onChanged: (double newValue) {
                        setState(() {
                          height=newValue.round();
                        });
                    },
                    ),
                  ),
                ],
              )),
              ),

            ],
          ),
          ),
          Expanded(child: Row(
            children:  [
              Expanded(child: ReusableCard(inactiveCardColor,Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WEIGHT",
                  style:TextStyle(
                    color: Colors.white
                  )),
                  Text(weight.toString()
                  ,style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: Icons.remove,onPressed:
                      (){
                        setState(() {
                          weight--;
                        });
                      },),
                      SizedBox(width: 15.0),
                      RoundIconButton(icon: Icons.add,onPressed: (){
                        setState(() {
                          weight++;
                        });
                      },
                      )
                    ],
                  )

                ],
              )),
              ),
              Expanded(child: ReusableCard(inactiveCardColor,Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("AGE",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 15.0
                  ),),
                  Text(age.toString(),
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.white
                  ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: Icons.remove,onPressed:
                          (){
                        setState(() {
                          age--;
                        });
                      },),
                      SizedBox(width: 15.0),
                      RoundIconButton(icon: Icons.add,onPressed: (){
                        setState(() {
                          age++;
                        });
                      },
                      )

                    ],
                  )



                ],
              )),
              ),
            ],
          ),),
          GestureDetector(
            onTap: (){

              CalculatorBrain calc=CalculatorBrain(height: height,weight :weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ResultsPage(
                    bmiResults: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInter(),
                  )));

            },
            child: Container(
              alignment: Alignment.center,
              child: Text("CALCULATE"
              ,style: TextStyle(
                  fontSize: 20.0,
                  color:Colors.black54,
                  fontWeight: FontWeight.bold
                ),
              ),
              color:Colors.white,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
            ),
          )
        ],
      )

    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      child:Icon(icon),
        onPressed:
        onPressed
        ,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(
      ),
      fillColor: Colors.yellow,
    );
  }
}




