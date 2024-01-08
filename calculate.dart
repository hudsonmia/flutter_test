class Calculate {
  


  double calc(String infix){
    List<String> postfix = [];
    List<String> stack = [];
    Map<String, int> precedence = {'+': 1, '-': 1, '*': 2, '/': 2};

    print(infix.split(' '));
    for (String token in infix.split(' ')) {
    if(token=='') continue;
    if (isNum(token)) {
      postfix.add(token);
    } else if (token == '(') {
      stack.add(token);
    } else if (token == ')') {
      while (stack.isNotEmpty && stack.last != '(') {
        postfix.add(stack.removeLast());
      }
      stack.removeLast(); // 여는 괄호 '(' 제거
    } else {
        while (stack.isNotEmpty && precedence[stack.last]! >= precedence[token]!) {
          postfix.add(stack.removeLast());
        }
        stack.add(token);
     }
    }

    while (stack.isNotEmpty) {
      postfix.add(stack.removeLast());
    }

    ExpTree temp = ExpTree(postfix);

    return temp.evaluate();
    }


  }

class Node {
  String value;
  Node? left, right;

  Node(this.value, {this.left, this.right});
}

class ExpTree {
  Node? root;

  ExpTree(List<String> postfix){
    root = _build(postfix);
  }

  double evaluate() => _evaluate(root);
  
  Node? _build(List<String> postfix){
    var stack = <Node>[];
    for(String i in postfix){
      if(isOp(i)){
        // op
        var right = stack.removeLast();
        var left = stack.removeLast();
        stack.add(Node(i, left: left, right: right));
      } else{
        // num
        stack.add(Node(i));
      }
    }
    return stack.isEmpty ? null : stack.removeLast();
  }

  double _evaluate(Node? node){
    if (node == null) return 0;
    if (!isOp(node.value)) return double.parse(node.value);

    double leftVal = _evaluate(node.left);
    double rightVal = _evaluate(node.right);

    switch (node.value) {
      case '+':
        return leftVal + rightVal;
      case '-':
        return leftVal - rightVal;
      case '×':
        return leftVal * rightVal;
      case '÷':
        return leftVal / rightVal;
      default:
        throw Exception('Unknown operator: ${node.value}');
    }
  }

  void init(){
    root = null;
  }
}

bool isOp (String value)=> '+-×÷'.contains(value);
bool isNum (String value)=> value=='(' || value == ')' ? false : !isOp(value);