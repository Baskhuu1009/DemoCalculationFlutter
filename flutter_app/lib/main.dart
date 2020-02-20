import 'package:flutter/material.dart';
import 'package:flutter_app/calculate.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator_Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: '計算機'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //計算結果を代入、画面上に表示変数
  String output = "0";
  String _output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";
  //_output = calculate.calculateButton(buttonValiue);
//ボタン押下時計算処理
  calculateButton(String buttonValue){
    if(buttonValue == "クエリ"){
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonValue == "+" || buttonValue == "-" || buttonValue == "/" || buttonValue == "X"){
      num1 = int.parse(output);
      operand = buttonValue;
      _output = "0";
    } else if (buttonValue == "="){
      num2 = int.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonValue;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

//ボタンのデザイナ
  Widget oneButtonDesign(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(34.0),
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            //計算処理メソッドに各ボタン値を渡す
          calculateButton(buttonText),
      ),
    );
  }

  //画面のUI部分
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Column(
              children: <Widget>[
                //下記コンテナは結果表示部分
                new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 24.0
                    ),
                    child: new Text(output, style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
                //各ボタン値を入力する画面UI部分
                new Expanded(
                  child: new Divider(),
                ),
                new Column(children: [
                  new Row(children: [
                    oneButtonDesign("7"),
                    oneButtonDesign("8"),
                    oneButtonDesign("9"),
                    oneButtonDesign("/")
                  ]),
                  new Row(children: [
                    oneButtonDesign("4"),
                    oneButtonDesign("5"),
                    oneButtonDesign("6"),
                    oneButtonDesign("X")
                  ]),
                  new Row(children: [
                    oneButtonDesign("1"),
                    oneButtonDesign("2"),
                    oneButtonDesign("3"),
                    oneButtonDesign("-")
                  ]),
                  new Row(children: [
                    oneButtonDesign("0"),
                    oneButtonDesign("+")
                  ]),
                  new Row(children: [
                    oneButtonDesign("クエリ"),
                    oneButtonDesign("="),
                  ])
                ])
              ],
            )));
  }
}
