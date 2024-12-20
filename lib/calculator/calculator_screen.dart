import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Controllers for input fields
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  double result = 0; // Holds the calculation result

  // Function to perform calculations
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
      backgroundColor: Colors.teal[600],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCustomTextField(num1Controller, "Num1"),
                      SizedBox(height: 20),
                      _buildCustomTextField(num2Controller, "Num2"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Result = $result',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.teal[600],
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOperationButton('+'),
                  _buildOperationButton('-'),
                  _buildOperationButton('x'),
                  _buildOperationButton('/'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.teal[600],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildOperationButton(String operator) {
    return ElevatedButton(
      onPressed: () => calculate(operator),
      child: Text(
        operator,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
    );
  }
}
