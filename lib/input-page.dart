import 'package:bmi_calculators_new_verstion/result-page.dart';
import 'package:bmi_calculators_new_verstion/reusable-card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'conistants.dart';
import 'icon-contenet.dart';
import 'calculatorbrain.dart';


enum Gender {male , female }
Gender selectedGender;
class InputPage extends StatefulWidget {
  @override
    _InputPageState createState() => _InputPageState();

}

  class _InputPageState extends State<InputPage>{

  int hight=180;
  int weight=80;
  int age=23;

//  Color maleCardColor = Color(0xFF1D1E33);
//  Color femaleCardColor = Color(0xFF1D1E33);

  //if gender is 1 thats mean male , if gender is 2 2thats mean female ;
//  void updateColor({Gender gender} ){
//
//    if(gender ==Gender.male){
//      if(maleCardColor==inactiveCardColor)
//      maleCardColor=activeCardColor;
//      femaleCardColor = inactiveCardColor;
//    }else{
//      maleCardColor=inactiveCardColor;
//    }
//    if(gender ==Gender.female){
//      if(femaleCardColor==inactiveCardColor)
//        femaleCardColor=activeCardColor;
//        maleCardColor = inactiveCardColor;
//    }else{
//      femaleCardColor=inactiveCardColor;
//    }
//
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title:new Text('BMI CALCULATOR') ,
      ) ,
      body: Column(//whole Scaffold
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          //Top Container
          Expanded(flex: 4,
              child:Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      color:selectedGender==Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CustomizeIcon(
                          icon:FontAwesomeIcons.mars ,
                          text:'MALE'),

                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender=Gender.female;
                        });
                      },
                      color:selectedGender==Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CustomizeIcon(icon:FontAwesomeIcons.venus ,text:'FEMALE'),

                    )
                  )

                ],) ),
          //Center Container
          Expanded(
            flex: 4,
            child: ReusableCard(
              color:kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text (
                    'HIGHT',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(hight.toString(),
                      style: kNumberTextStyle,),
                      SizedBox(
                        width: 1.0,
                      ),

                      Text('cm',style: kLableTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 120.0,
                        max: 220.0,
                        value: hight.toDouble(),
                      onChanged: (double newValue){
                          setState(() {
                            hight=newValue.round();
                          });
                      },

                    ),
                  )
                ],
              ),


            ),
          ),

          //Bottom Container
          Expanded(flex: 4,
              child:Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ReusableCard(
                      color:kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Text('WEIGHT',style: kLableTextStyle,),
                          Text(weight.toString(),style: kNumberTextStyle,),
                         // SizedBox(height: 10.0,),
                          Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                               setState(() {
                                 weight++;
                               });
                             },),
                             SizedBox(width: 10.0,),
                             RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                               setState(() {
                                 weight--;
                               });
                             },),
                           ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ReusableCard(
                      color:kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Text('AGE',style: kLableTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          // SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                                setState(() {
                                  age++;
                                });
                              },),
                              SizedBox(width: 10.0,),
                              RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],) ),
          //Bottom Button
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = new CalculatorBrain(height: hight, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                        bmiResult:calc.calculateBMI(),
                        resultText:calc.getResult(),
                        interpretation:calc.getInterpretation()
                    ),
                  )
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              height: kButtomHight,
              width: double.infinity,
              color:kBottomContainerColor ,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style:kLargeBottomTextStyle,
                ),
              ),

            ),
          )
        ],
      )

    );
  }

  }
  
  
  class RoundIconButton extends StatelessWidget {

  final IconData icon ;
  final Function onPress;
  RoundIconButton({this.icon,@required this.onPress});
    @override
    Widget build(BuildContext context) {
      return RawMaterialButton(
        onPressed: onPress,
         child: Icon(icon),
        constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),


      );
    }
  }
  




