import 'package:bmi_calcuator/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});


  final String bmiResult;
  final String resultText;
  final String interpretation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft  ,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),

          ),

          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kResultTextStyle,),
                  Text(bmiResult.toString(), style: kBMITextStyle,),
                  Text(interpretation,
                  style: kBMIDescription,
                  textAlign: TextAlign.center,)


                ]
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text('RE-CALCULATE'),),
              color: kbottomContainerColor,
              width: double.infinity,
              height: kbottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
            ),
          )
        ],
      ),
    );
  }
}
