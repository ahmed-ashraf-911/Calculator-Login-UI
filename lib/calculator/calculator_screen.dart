import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Text controllers to retrieve user input
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  double result = 0;

  void calculate(String operator) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    setState(() {
      if (operator == '+') result = num1 + num2;
      if (operator == '-') result = num1 - num2;
      if (operator == 'x') result = num1 * num2;
      if (operator == '/') {
        result = num2 != 0 ? num1 / num2 : 0; // Prevent division by zero
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // First Input Field
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: num1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Num1',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white54,
                      ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                      controller: num2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Num2',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 50,
                color: Colors.teal,
              ),
              Text(
                'Result = $result',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Container(
                height: 20,
                width: 50,
                color: Colors.teal,
              ),
            ],
          ),
          SizedBox(height: 40),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => calculate('+'),
                    child: Text('+'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),

                  // Subtract Button
                  ElevatedButton(
                    onPressed: () => calculate('-'),
                    child: Text('-'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () => calculate('x'),
                    child: Text('x'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),

                  // Divide Button
                  ElevatedButton(
                    onPressed: () => calculate('/'),
                    child: Text('/'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
