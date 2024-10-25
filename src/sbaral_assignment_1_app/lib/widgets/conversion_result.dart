import 'package:flutter/material.dart';

class ConversionResult extends StatelessWidget {
  final String value;
  final String fromUnit;
  final String toUnit;
  final String result;

  ConversionResult({
    required this.value,
    required this.fromUnit,
    required this.toUnit,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value $fromUnit are $result $toUnit',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.blueAccent,
      ),
    );
  }
}
