class Calculate {
  static var num = "0"; // 화면에 나올 숫자
  static var num_fst = "0"; // 첫째숫자
  static var num_snd = "0"; // 둘째숫자
  static bool is_snd = false;
  static var num_last = "0"; // 결과값
  static var cal_sign = 4;   // 연산자가 아래 리스트중 무엇인가 4는 아직 없는 상태
  static var cal_sign_lst = ["+", "-", "×", "÷"];

  static void equation(i){ // 연산자가 없다면(4라면) 첫째 숫자, 있다면(4가 아니라면) 둘째 숫자 설정
    if (cal_sign == 4){
      if (num == "0" || num == "0.0"){
        num_fst = i;
      }
      else {
        num_fst = num_fst+i;
      }
    }
    else{
      if (num_snd == "0" || num == "0.0"){
        num_snd = i;
      }
      else{
        num_snd = num_snd+i;
      }
      is_snd = true;
    }
  }

  static void sign(j){ // 연산자 설정
    if (cal_sign != 4){
      cal_sign = cal_sign_lst.indexOf(j);
    }
    else{
      cal_sign = cal_sign_lst.indexOf(j);
      num_snd = "0";
    }
  }

  static void make_percent(){     // 퍼센트 변환
    if (cal_sign == 4){
      num_fst = (double.parse(num_fst)*0.01).toString();
      num_fst = decimal(num_fst);
      num_fst = decimal2(num_fst);
    }
    else{
      num_snd = (double.parse(num_snd)*0.01).toString();
      num_snd = decimal(num_snd);
      num_snd = decimal2(num_snd);
    }
  }

  static void plmi(){       // +- 변환
    if (cal_sign == 4){
      if (num_fst == "0"){
        return;
      }
      num_fst = (-double.parse(num_fst)).toString();
      num_fst = decimal(num_fst);
      num_fst = decimal2(num_fst);
    }
    else{
      if (num_snd == "0"){
        return;
      }
      num_snd = (-double.parse(num_snd)).toString();
      num_snd = decimal(num_snd);
      num_snd = decimal2(num_snd);
    }
  }

  static void clear(){    // 초기화
    num_last = decimal(num_last);
    num_last = decimal2(num_last);
    num_fst = num_last;  
    num_snd = "0";
    num_last = "0";
    is_snd = false;
    cal_sign = 4;
    num = num_fst.toString();
  }

  static void make_decimal(){
    if (cal_sign == 4){
      if (hasDecimalPart(double.parse(num_fst))){
        return;
      }
      num_fst = num_fst + ".";
    }
    else{
      if (hasDecimalPart(double.parse(num_snd))){
        return;
      }
      num_snd = num_snd + ".";
    }
  }

  static bool hasDecimalPart(double number) {  // 소수점을 가지고 있는지 판단
    return number.remainder(1) != 0;
  }

  static String decimal(deci_num){   // 소수점 처리
    if (! hasDecimalPart(double.parse(deci_num))){ // 정수면 3.0 -> 3
      return (double.parse(deci_num).toStringAsFixed(0)).toString();
    }
    else{                                          // 소수가 나오면 소수점 7번째까지 표시
      return (double.parse(deci_num).toStringAsFixed(7)).toString();
    }
  }
  static String decimal2(deci_num){
    if (hasDecimalPart(double.parse(deci_num))){
      while((double.parse(deci_num.replaceAll(".",""))%10) == 0){        // 소수점 아래 0 제거 작업
        deci_num = deci_num.substring(0, deci_num.length-1);
      }
    }
    return deci_num;
  }

  static void equ_result(){ // = 연산자 결과값
    switch (cal_sign){
      case 0:
        num_last = (double.parse(num_fst) + double.parse(num_snd)).toString();
        break;
      case 1:
        num_last = (double.parse(num_fst) - double.parse(num_snd)).toString();
        break;
      case 2:
        num_last = (double.parse(num_fst) * double.parse(num_snd)).toString();
        break;
      case 3:
        if (num_snd != 0){
          num_last = (double.parse(num_fst) / double.parse(num_snd)).toString();
        }
        break;
      case 4:
        return;
    }
    clear();
  }
}