import 'package:flutter/material.dart';
import '../utils/conversion_logic.dart';
import '../widgets/conversion_result.dart';

class ConverterScreen extends StatefulWidget {
  final String title;
  const ConverterScreen({super.key, required this.title});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _valueController = TextEditingController();
  String _fromUnit = 'meters';
  String _toUnit = 'feet';
  String? _conversionResult;
  String? _errorText;

  void _convert() {
    setState(() {
      _errorText = null;
      _conversionResult = null;

      double? inputValue = double.tryParse(_valueController.text);

      if (inputValue == null) {
        _errorText = 'Please enter a valid number';
        return;
      }

      _conversionResult = convertUnits(inputValue, _fromUnit, _toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Value',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter value',
                errorText: _errorText,
              ),
            ),
            SizedBox(height: 16.0),
            Text('From', style: TextStyle(fontSize: 18.0)),
            DropdownButton<String>(
              value: _fromUnit,
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _fromUnit = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('To', style: TextStyle(fontSize: 18.0)),
            DropdownButton<String>(
              value: _toUnit,
              items: units.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _toUnit = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: _convert,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text('Convert'),
              ),
            ),
            SizedBox(height: 16.0),
            if (_conversionResult != null)
              ConversionResult(
                value: _valueController.text,
                fromUnit: _fromUnit,
                toUnit: _toUnit,
                result: _conversionResult!,
              ),
          ],
        ),
      ),
    );
  }
}
