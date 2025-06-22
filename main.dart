import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});
  @override
  State<CalculatorApp> createState() => _CalculatorApp();
}

class _CalculatorApp extends State<CalculatorApp> {
  String _output = '';
  String _currVal = '';
  String _operator = '';
  String _previousVAl = '';
  double? switchCase(String operator, double num1, double num2) {
    double result = 0;
    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      default:
        result = 0;
    }

    return result;
  }

  void _onPressed(String value) {
    if (value == 'AC') {
      _output = '0';
      _currVal = '';
      _operator = '';
      _previousVAl = '';
    } else if (value == '+' || value == '-' || value == '/' || value == '*') {
      if (_operator != '' && _currVal.isNotEmpty) {
        double num1 = double.parse(_previousVAl);
        double num2 = double.parse(_currVal);
        double? result = switchCase(_operator, num1, num2);
        _previousVAl = result?.toString() ?? '';
        _currVal = '';
      } else {
        _previousVAl = _currVal;
        _currVal = '';
      }
      _operator = value;
      _output = _previousVAl + _operator;
    } else if (value == '=') {
      double result = 0;
      double num1 = double.parse(_previousVAl);
      double num2 = double.parse(_currVal);
      switch (_operator) {
        case '+':
          result = num1 + num2;
          break;
        case '/':
          result = num1 / num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        default:
          result = 0;
      }
      _output = result.toStringAsFixed(2);
      _currVal = result.toString();
      _previousVAl = '';
      _operator = '';
    } else if (value == 'Correct') {
      String _helper = _currVal.substring(0, _currVal.length - 1);
      _currVal = _helper;
      _output = _previousVAl + _operator + _helper;
    } else {
      _currVal += value;
      _output = _previousVAl + _operator + _currVal;
    }
    setState(() {});
  }

  // final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          child: (Text(
            'Made By HAMZA   </> ',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Calculator ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 100,
                  width: 370,
                  child: Text(
                    _output,
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),

                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('7'),

                      child: Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('8'),
                      child: Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('9'),
                      child: Text(
                        '9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange),
                      ),
                      onPressed: () => _onPressed('AC'),
                      child: Text(
                        'AC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),

                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('4'),
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('5'),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('6'),
                      child: Text(
                        '6',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('/'),
                      child: Text(
                        '/',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),

                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('1'),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('2'),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('3'),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('-'),
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),
                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('.'),
                      child: Text(
                        '.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('0'),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('*'),
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('+'),
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[850],
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(150, 2),
                      ),
                      onPressed: () => _onPressed('='),
                      child: Text(
                        '=',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                      ),
                      onPressed: () => _onPressed('Correct'),
                      child: Text(
                        'Correct',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          //  fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








//------------------------------------

/*


import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});
  @override
  State<CalculatorApp> createState() => _CalculatorApp();
}

class _CalculatorApp extends State<CalculatorApp> {
  String _output = '';
  String _currVal = '';
  String _operator = '';
  String _previousVAl = '';
  double? switchCase(String operator, double num1, double num2) {
    double result = 0;
    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      default:
        result = 0;
    }

    return result;
  }

  void _onPressed(String value) {
    if (value == 'AC') {
      _output = '0';
      _currVal = '';
      _operator = '';
      _previousVAl = '';
    } else if (value == '+' || value == '-' || value == '/' || value == '*') {
      if (_operator != '' && _currVal.isNotEmpty) {
        double num1 = double.parse(_previousVAl);
        double num2 = double.parse(_currVal);
        double? result = switchCase(_operator, num1, num2);
        _previousVAl = result?.toString() ?? '';
        _currVal = '';
      } else {
        _previousVAl = _currVal;
        _currVal = '';
      }
      _operator = value;
      _output = _previousVAl + _operator;
    } else if (value == '=') {
      double result = 0;
      double num1 = double.parse(_previousVAl);
      double num2 = double.parse(_currVal);
      switch (_operator) {
        case '+':
          result = num1 + num2;
          break;
        case '/':
          result = num1 / num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        default:
          result = 0;
      }
      _output = result.toStringAsFixed(2);
      _currVal = result.toString();
      _previousVAl = '';
      _operator = '';
    } else if (value == 'Correct') {
      String _helper = _currVal.substring(0, _currVal.length - 1);
      _currVal = _helper;
      _output = _previousVAl + _operator + _helper;
    } else {
      _currVal += value;
      _output = _previousVAl + _operator + _currVal;
    }
    setState(() {});
  }

  // final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          child: (Text(
            'Made By HAMZA   </> ',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(
            'Calculator ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 100,
                  width: 370,
                  child: Text(
                    _output,
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),

                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('7'),

                      child: Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('8'),
                      child: Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('9'),
                      child: Text(
                        '9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange),
                      ),
                      onPressed: () => _onPressed('AC'),
                      child: Text(
                        'AC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),

                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('4'),
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('5'),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('6'),
                      child: Text(
                        '6',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('/'),
                      child: Text(
                        '/',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),

                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('1'),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('2'),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('3'),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('-'),
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),

                margin: EdgeInsets.all(10),
                color: Colors.grey[850],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('.'),
                      child: Text(
                        '.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () => _onPressed('0'),
                      child: Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('*'),
                      child: Text(
                        '*',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () => _onPressed('+'),
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[850],
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(150, 2),
                      ),
                      onPressed: () => _onPressed('='),
                      child: Text(
                        '=',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                      ),
                      onPressed: () => _onPressed('Correct'),
                      child: Text(
                        'Correct',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          //  fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



*/