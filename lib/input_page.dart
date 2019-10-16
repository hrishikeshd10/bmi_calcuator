import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'resultsPage.dart';
import 'calcuatorBrain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;

  Gender selectedGender;

  int height = 120;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
          backgroundColor: Color(0xFF0A0E21),
          elevation: 0.00,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('MALE', style: klabelTextStyle)
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      selectedGender = Gender.female;
                    },
                    colour: selectedGender == Gender.female
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.00,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('FEMALE', style: klabelTextStyle)
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: klabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: kbottomContainerColor,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    colour: kactiveCardColor)),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),

                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           RoundIconButton(
                             iconData: FontAwesomeIcons.minus,
                            onPressed: (){
                               setState(() {
                                 weight--;
                               });
                            },
                           ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(iconData: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },)
                        ],
                      )
                    ],
                  ),

                  ),),
                  Expanded(child: ReusableCard(colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: klabelTextStyle,
                      ),

                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(iconData: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },)
                        ],
                      )
                    ],
                  ) ,))
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);



                Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretations(),

                )));
              },
              child: Container(
                child: Center(child: Text('CALCULATE'),),
                color: kbottomContainerColor,
                width: double.infinity,
                height: kbottomContainerHeight,
                margin: EdgeInsets.only(top: 10.0),
              ),
            )
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.iconData,this.onPressed});

  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(iconData),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}
