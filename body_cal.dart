// ignore_for_file: deprecated_member_use, prefer_const_constructors, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:calculator/calculate.dart';

class Bodycal extends StatefulWidget {
  const Bodycal({Key? key}) : super(key: key);

  @override
  BodycalState createState() => BodycalState();
}

class BodycalState extends State<Bodycal> {
  static double bt_inter = 10;
  static String num_result = "";
  var calculator = Calculate();

  void answer(){  // 실시간으로 화면에 띄울 숫자 업로드
    setState(() {
       num_result = calculator.calc(num_result).toString();
    });
  }

  void add(String s){
    setState((){
      num_result = num_result + " "+s; 
    });
  }

  void init(){
    setState((){
      num_result = ""; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 150,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  child: Center(
                    // child: Column(                              // 미구현
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Image.asset(
                    //       'assets/clock.png', 
                    //       width: 30,
                    //       height: 30,
                    //     ),
                    //     SizedBox(height: bt_inter),
                    //   ],
                    // ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                      num_result,
                      style: TextStyle(fontSize: 50),
                      textAlign:TextAlign.center,
                    ),
                    ),
                  ),
                ),
              ),
              Expanded(                          // 오른쪽 간격을 위한 박스
                flex: 1,
                child: Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  child: const Center(                   
                    child: Text(""),
                  ),
                ),
              ),
            ],
          ),
        ), // 위 부분
        Expanded(
          flex: 1,
          child: Container(
            color: Color.fromARGB(255, 173, 173, 173),
          )),
        Expanded(         // 아래 부분 중 1 (c, 7, 4, 1, +/-)버튼
          flex: 300,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: bt_inter),
                        G_Btn("C"),
                        SizedBox(height: bt_inter),
                        Num_Btn("7"),
                        SizedBox(height: bt_inter),
                        Num_Btn("4"),
                        SizedBox(height: bt_inter),
                        Num_Btn("1"),
                        SizedBox(height: bt_inter),
                        G_Btn("+/-"),
                        SizedBox(height: bt_inter),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(                                 // 2 ((),8,5,2,0)버튼
                flex: 1,
                child: Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: bt_inter),
                        Op_Btn("()"),
                        SizedBox(height: bt_inter),
                        Num_Btn("8"),
                        SizedBox(height: bt_inter),
                        Num_Btn("5"),
                        SizedBox(height: bt_inter),
                        Num_Btn("2"),
                        SizedBox(height: bt_inter),
                        Num_Btn("0"),
                        SizedBox(height: bt_inter),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(                                 // 3 (%, 9, 6, 3, .) 버튼
                flex: 1,
                child: Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: bt_inter),
                        Op_Btn("%"),
                        SizedBox(height: bt_inter),
                        Num_Btn("9"),
                        SizedBox(height: bt_inter),
                        Num_Btn("6"),
                        SizedBox(height: bt_inter),
                        Num_Btn("3"),
                        SizedBox(height: bt_inter),
                        G_Btn("."),
                        SizedBox(height: bt_inter),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(                             // 4 (사칙연산) 버튼
                flex: 1,
                child: Container(
                  color: Color.fromARGB(255, 233, 233, 233),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: bt_inter),
                        Op_Btn("÷"),
                        SizedBox(height: bt_inter),
                        Op_Btn("×"),
                        SizedBox(height: bt_inter),
                        Op_Btn("-"),
                        SizedBox(height: bt_inter),
                        Op_Btn("+"),
                        SizedBox(height: bt_inter),
                        Op_Btn("="),
                        SizedBox(height: bt_inter),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// Calculator Abstract Btn
abstract class Btn extends StatelessWidget{
  final String contents;
  final Color color;
  const Btn(this.contents, this.color, {Key? key}) : super(key: key);

  void act(BuildContext context);  //  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            primary: color,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            minimumSize: Size(
                MediaQuery.of(context).size.width * 0.2, 0)),
        onPressed: () {
          act(context);
        },
        child: Text(contents,
          style: TextStyle(
              fontSize:
                  MediaQuery.of(context).size.height * 0.05),
        ),
      ),
    );
  }
}

// 0-9 decimal btn
class Num_Btn extends Btn{
   const Num_Btn(String contents, {Key? key}) : super(contents, Colors.black, key: key);
  @override
  void act(BuildContext context){
    print(this.contents);
    (context.findAncestorStateOfType<BodycalState>() as BodycalState).add(contents);
  }
}

// operation btn
class Op_Btn extends Btn{
  const Op_Btn(String contents, {Key? key}) : super(contents, Colors.green, key: key);
  @override
  void act(BuildContext context){
    print(this.contents);
    var body = (context.findAncestorStateOfType<BodycalState>() as BodycalState);
  if(contents=='='){
      body.answer();
  }else{
  body.add(contents);
  }
  }
}

// general purpose btn
class G_Btn extends Btn{
   const G_Btn(String contents, {Key? key}) : super(contents, Colors.black, key: key);
  @override
  void act(BuildContext context){
    print(this.contents);
    var body = (context.findAncestorStateOfType<BodycalState>() as BodycalState);
    if(contents=='C'){
      body.init();
    } else if(contents=='='){
      body.answer();
    } else{
      body.add(contents);
    }
  }
}
