import 'package:math_expressions/math_expressions.dart';

import 'package:flutter/material.dart';

import '../constants/dimes.dart';
import '../constants/strings.dart';
import '../easy_widgets/easy_elevated_button_widget.dart';
import '../easy_widgets/easy_text_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput="0";
  String result="0";
  String expression="";
  double tempResult=0;

  //onPressedFunction
  onPress(String buttonInput){
    setState(() {
      //clear all
      if(buttonInput==ac){
        userInput="0";
        result="0";
        //delete
      }else if(buttonInput==delete){
        userInput=userInput.substring(0,userInput.length-1);
        if(userInput==""){
          userInput="0";
        }
        //show answer
      }else if(buttonInput==equal){
        expression=userInput;
        expression=expression.replaceAll('×','*');
        expression=expression.replaceAll('÷','/');
        try{
          Parser p=Parser();
          Expression exp=p.parse(expression);
          ContextModel cm=ContextModel();
          result='${exp.evaluate(EvaluationType.REAL, cm)}';
          //round up to 5 decimal places
          tempResult=double.parse(result);
          result=tempResult.toStringAsFixed(5);
        }catch(e){
          result="Error";
        }
        //pretend not to overlap process signs
      }else if(buttonInput==add || buttonInput==multiply || buttonInput==minus || buttonInput==divide || buttonInput==modulus){
        String lastChar=userInput[userInput.length-1];
        if(lastChar==add || lastChar==multiply || lastChar==minus || lastChar==divide || lastChar==modulus){
          userInput=userInput.substring(0,userInput.length-1);
          userInput+=buttonInput;
        }else{
          userInput+=buttonInput;
        }
        //numbers input
      }else{
        if(userInput=="0"){
          userInput=buttonInput;
        } else{
          userInput+=buttonInput;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body:Column(
        children:[
          const SizedBox(
            height: sizedBoxHeight,
          ),
          // equation container
          Container(
            width: double.infinity,
            height: equationContainerHeight,
            padding:const EdgeInsets.only(right: kSP20x),
            child:Align(
              alignment: Alignment.bottomRight,
              child:EasyTextWidget(text: userInput,fontSize: equationFontSize,color: Colors.white),
              ),
          ),

          //answer container
          Container(
            width: double.infinity,
            height: answerContainerHeight,
            padding:const EdgeInsets.only(right: kSP20x),
            child:Align(
              alignment: Alignment.bottomRight,
              child:EasyTextWidget(text: result,fontSize: answerFontSize,color: Colors.white),
            ),
          ),

          //calculator pad
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:const EdgeInsets.only(left: kSP5x),
                child: Row(
                  children: [
                    SizedBox(
                      width: leftCalcPadSizedBoxWidth,
                      child: Wrap(
                        spacing: wrapSpacingLeft,
                        runSpacing: wrapRunSpacingleft,
                        children:[
                          EasyElevatedButtonWidget(
                            buttonIcon: ac,
                            textColor: Colors.deepPurple,
                            func: (){
                              onPress(ac);
                            },

                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: divide,
                            textColor: Colors.deepPurple,
                            func: (){
                              onPress(divide);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: multiply,
                            textColor: Colors.deepPurple,
                            func: (){
                              onPress(multiply);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: seven,
                            func: (){
                              onPress(seven);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: eight,
                            func: (){
                              onPress(eight);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: nine,
                            func: (){
                              onPress(nine);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: four,
                            func: (){
                              onPress(four);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: five,
                            func: (){
                              onPress(five);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: six,
                            func: (){
                              onPress(six);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: one,
                            func: (){
                              onPress(one);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: two,
                            func: (){
                              onPress(two);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: three,
                            func: (){
                              onPress(three);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: dot,
                            func: (){
                              onPress(dot);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: zero,
                            func: (){
                              onPress(zero);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: modulus,
                            func: (){
                              onPress(modulus);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: rightCalcPadSizedBoxWidth,
                      child: Wrap(
                        spacing: wrapSpacingRight,
                        direction: Axis.vertical,
                        children:[
                          EasyElevatedButtonWidget(
                            buttonIcon: delete,
                            buttonColor: Colors.deepPurple,
                            func: (){
                              onPress(delete);
                            },
                            height: deleteButtonHeight,

                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: minus,
                            buttonColor: Colors.deepPurple,
                            func: (){
                              onPress(minus);
                            },
                            height: minusButtonHeight,
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: add,
                            buttonColor: Colors.deepPurple,
                            height: addButtonHeight,
                            func: (){
                              onPress(add);
                            },
                          ),
                          EasyElevatedButtonWidget(
                            buttonIcon: equal,
                            buttonColor: Colors.deepPurple,
                            height: equalButtonHeight,
                            func: (){
                              onPress(equal);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}







