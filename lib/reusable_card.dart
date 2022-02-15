import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard(@required this.colour,this.cardChild);

  final Color colour;
  final Widget cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(
      child:cardChild,
      margin: EdgeInsets.all(15.0),
      width: 100,
      height: 170,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: Offset(-2.0, -2.0),
            blurRadius: 4.0,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: Offset(6.0, 6.0),
            blurRadius: 6.0,
          ),
        ],
        color: colour,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
