import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String showText = '0';
  String? btnText;
  Color? btnColor;
  Color? txtColor;

  // Holders
  int num1 = 0;
  int num2 = 0;
  String? op;
  String cache = '';
  String result = '';

  void calc(String btnText) {
    switch (btnText) {
      case 'AC':
        setState(() {
          result = '0';
          num1 = 0;
          num2 = 0;
          op = '';
          cache = '';
        });
        break;
      case '+/-':
        if (result != '0') {
          int n = int.parse(showText) * -1;
          setState(() {
            result = n.toString();
          });
        } else {
          setState(() {
            result = 'error';
          });
        }
        break;
      case '%':
        num1 = int.parse(showText);
        double n = (num1 / 100);
        result = n.toStringAsFixed(0);
        setState(() {
          showText = result;
          cache = '$num1 %';
        });
        break;
      case '÷':
        num1 = int.parse(showText);
        op = btnText;
        setState(() {
          result = '';
        });
        break;
      case 'X':
        num1 = int.parse(showText);
        op = btnText;
        setState(() {
          result = '';
        });
        break;
      case '-':
        num1 = int.parse(showText);
        op = btnText;
        print('- T1kland1');
        setState(() {
          result = '';
        });
        break;
      case '+':
        num1 = int.parse(showText);
        op = btnText;
        setState(() {
          result = '';
        });
        break;
      case '=':
        if (op == '+') {
          num2 = int.parse(showText);
          result = (num1 + num2).toString();
          print(result);
          setState(() {
            cache = '$num1 $op $num2';
          });
        } else if (op == '-') {
          num2 = int.parse(showText);
          result = (num1 - num2).toString();
          setState(() {
            cache = '$num1 $op $num2';
          });
        } else if (op == '÷') {
          num2 = int.parse(showText);
          result = (num1 / num2).toString();
          setState(() {
            showText = result;
            cache = '$num1 $op $num2';
          });
        } else if (op == 'X') {
          num2 = int.parse(showText);
          result = (num1 * num2).toString();
          setState(() {
            showText = result;
            cache = '$num1 $op $num2';
          });
        }
        setState(() {
          showText = result;
        });
        break;
      default:
        if (result == 'error') {
          setState(() {
            showText = 'Error';
            result = int.parse(showText + btnText).toString();
          });
        } else {
          setState(() {
            result = int.parse(showText + btnText).toString();
          });
        }
    }
    showText = result;
  }

  Widget calcButton(btnText, btnColor, txtColor) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: btnColor,
          onPrimary: Colors.white,
        ),
        onPressed: () => calc(btnText),
        child: Text(
          btnText,
          style: TextStyle(color: txtColor, fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenWidht = screenInfo.size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 220.0),
              child: Text(
                '$cache',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              '$showText',
              style: TextStyle(fontSize: 80, color: Colors.white),
            ),
            // Row 1
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // AC Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('AC', Colors.grey, Colors.black),
                  ),
                  // +/- Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('+/-', Colors.grey, Colors.black),
                  ),
                  // % Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('%', Colors.grey, Colors.black),
                  ),
                  // ÷ Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('÷', Colors.orange, Colors.white),
                  ),
                ],
              ),
            ),
            //* Row 2 - 7,8,9,X
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 7 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '7',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // 8 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '8',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // 9 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '9',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // X Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('X', Colors.orange, Colors.white),
                  ),
                ],
              ),
            ),
            // Row 3 - 4,5,6,-
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 4 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '4',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // 5 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '5',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // 6 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '6',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // - Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('-', Colors.orange, Colors.white),
                  ),
                ],
              ),
            ),
            //Row 4 - 1,2,3,+
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 1 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '1',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // 2 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '2',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // 3 Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton(
                      '3',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // + Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('+', Colors.orange, Colors.white),
                  ),
                ],
              ),
            ),
            // Row 5 - 0,virgül(,),=
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 0 Button
                  SizedBox(
                    width: screenWidht / 2.2,
                    height: 90,
                    child: calcButton(
                      '0',
                      const Color.fromARGB(255, 58, 58, 58),
                      Colors.white,
                    ),
                  ),
                  // . Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('.', Colors.orange, Colors.white),
                  ),
                  // = Button
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: calcButton('=', Colors.orange, Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
