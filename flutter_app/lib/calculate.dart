class calculate {
  //計算結果を代入、画面上に表示変数
  String output = "0";
  String _output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

//ボタン押下時計算処理
  calculateButton(String buttonValue) {
    if (buttonValue == "クエリ") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonValue == "+" || buttonValue == "-" || buttonValue == "/" ||
        buttonValue == "X") {
      num1 = int.parse(output);
      operand = buttonValue;
      _output = "0";
    } else if (buttonValue == "=") {
      num2 = int.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonValue;
    }
  }
}