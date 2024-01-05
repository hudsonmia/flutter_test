import 'package:flutter/material.dart';
import 'package:calculator/calculate.dart';

class Bodycal extends StatefulWidget {
  const Bodycal({Key? key}) : super(key: key);

  @override
  BodycalState createState() => BodycalState();
}

class BodycalState extends State<Bodycal> {
  static double bt_inter = 10;
  static String num_result = "0";

  void calculator_Re(){  // 실시간으로 화면에 띄울 숫자 업로드
    setState(() {
      if (Calculate.cal_sign == 4){
        Calculate.num = Calculate.num_fst;
      }
      else{
        if (Calculate.is_snd){
          Calculate.num = Calculate.num_fst + Calculate.cal_sign_lst.elementAt(Calculate.cal_sign) + Calculate.num_snd;
        }
        else{
          Calculate.num = Calculate.num_fst + Calculate.cal_sign_lst.elementAt(Calculate.cal_sign);
        }
      }
      num_result = Calculate.num;
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
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.clear();
                              calculator_Re();
                            },
                            child: Text("C",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("7");
                              calculator_Re();
                              },
                            child: Text("7",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("4");
                              calculator_Re();
                            },
                            child: Text("4",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("1");
                              calculator_Re();
                            },
                            child: Text("1",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.plmi();
                              calculator_Re();
                            },
                            child: Text("+/-",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
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
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Color.fromARGB(255, 1, 165, 56),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {},
                            child: Text("()",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("8");
                              calculator_Re();
                              },
                            child: Text("8",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("5");
                              calculator_Re();
                            },
                            child: Text("5",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("2");
                              calculator_Re();
                            },
                            child: Text("2",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("0");
                              calculator_Re();
                            },
                            child: Text("0",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
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
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Color.fromARGB(255, 1, 165, 56),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.make_percent();
                              calculator_Re();
                            },
                            child: Text("%",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("9");
                              calculator_Re();
                              },
                            child: Text("9",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("6");
                              calculator_Re();
                            },
                            child: Text("6",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.equation("3");
                              calculator_Re();
                            },
                            child: Text("3",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.make_decimal();
                              calculator_Re();
                            },
                            child: Text(".",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05),
                            ),
                          ),
                        ),
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
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                primary: Color.fromARGB(255, 1, 165, 56),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.2, 0)),
                            onPressed: () {
                              Calculate.sign("÷");
                              calculator_Re();
                            },
                            child: Text("÷",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 1, 165, 56),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: Size(MediaQuery.of(context).size.width*0.2, 0)
                            ),
                            onPressed: () {
                              Calculate.sign("×");
                              calculator_Re();
                            },
                            child: Text("×",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 1, 165, 56),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: Size(MediaQuery.of(context).size.width*0.2, 0)
                            ),
                            onPressed: () {
                              Calculate.sign("-");
                              calculator_Re();
                            },
                            child: Text("-",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 1, 165, 56),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: Size(MediaQuery.of(context).size.width*0.2, 0)
                            ),
                            onPressed: () {
                              Calculate.sign("+");
                              calculator_Re();
                            },
                            child: Text("+",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.05),
                            ),
                          ),
                        ),
                        SizedBox(height: bt_inter),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color.fromARGB(255, 1, 165, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              minimumSize: Size(MediaQuery.of(context).size.width*0.2, 0)
                            ),
                            onPressed: () {
                              Calculate.equ_result();
                              calculator_Re();
                            },
                            child: Text("=",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.05),
                            ),
                          ),
                        ),
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