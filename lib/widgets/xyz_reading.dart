import 'package:emf_app/models/magnitude_provider.dart';
import 'package:emf_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class XYZReading extends StatefulWidget {
  const XYZReading({Key? key}) : super(key: key);

  @override
  _XYZReadingState createState() => _XYZReadingState();
}

class _XYZReadingState extends State<XYZReading> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MagnitudeProvider>(
      builder: (context, model, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(
                    value: 1,
                    groupValue: model.groupvalue,
                    onChanged: (dynamic value) => model.setUpdateInterval(
                        1, Duration.microsecondsPerSecond ~/ 1),
                  ),
                  const Text(
                    "1 FPS",
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Radio(
                    value: 2,
                    groupValue: model.groupvalue,
                    onChanged: (dynamic value) => model.setUpdateInterval(
                        2, Duration.microsecondsPerSecond ~/ 30),
                  ),
                  const Text(
                    "30 FPS",
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Radio(
                    value: 3,
                    groupValue: model.groupvalue,
                    onChanged: (dynamic value) => model.setUpdateInterval(
                        3, Duration.microsecondsPerSecond ~/ 60),
                  ),
                  const Text(
                    "60 FPS",
                    style: TextStyle(fontSize: 10.0),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Consumer<MagnitudeProvider>(
            builder: (context, model, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  textWidget('x: ${model.x.toStringAsFixed(2)}'),
                  textWidget('y: ${model.y.toStringAsFixed(2)}'),
                  textWidget('z: ${model.z.toStringAsFixed(2)}'),
                ]),
          ),
        ],
      ),
    );
  }
}
