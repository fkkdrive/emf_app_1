import 'package:emf_app/models/magnitude_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainReading extends StatefulWidget {
  const MainReading({Key? key}) : super(key: key);

  @override
  _MainReadingState createState() => _MainReadingState();
}

class _MainReadingState extends State<MainReading> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MagnitudeProvider>(
      builder: (context, model, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.magnitude.toStringAsFixed(2),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            ' μTesla',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
