import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
   
   final double ? num1 = double.tryParse(_num1Controller.text);
    final double ? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _result = 'Invalid input';
      });
      return;
    }

    setState(() {
      switch (operation) {
        case 'add':
          _result = 'Result: ${num1 + num2}';
          break;
        case 'sub':
          _result = 'Result: ${num1 - num2}';
          break;
        case 'mul':
          _result = 'Result: ${num1 * num2}';
          break;
        case 'div':
          _result = num2 != 0 ? 'Result: ${num1 / num2}' : 'Cannot divide by zero';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Simple Calculator", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.green),),
            const SizedBox(height: 20),
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter first number',border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              )),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter first number',border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),

              )),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('add'),
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('sub'),
                  child: const Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('mul'),
                  child: const Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('div'),
                  child: const Text('Divide'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}