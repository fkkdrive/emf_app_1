import 'package:emf_app/models/magnitude_provider.dart';
import 'package:emf_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MeterReading extends StatefulWidget {
  const MeterReading({Key? key}) : super(key: key);

  @override
  _MeterReadingState createState() => _MeterReadingState();
}

class _MeterReadingState extends State<MeterReading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Consumer<MagnitudeProvider>(
            builder: (context, model, child) =>
                SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 1010,
                  labelOffset: 20,
                  tickOffset: 20,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 200,
                      color: AppColors.green,
                      label: 'SAFE',
                      startWidth: 25,
                      endWidth: 25,
                      labelStyle: const GaugeTextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    GaugeRange(
                      startValue: 200,
                      endValue: 500,
                      color: AppColors.orange,
                      label: 'MODERATE',
                      startWidth: 25,
                      endWidth: 25,
                      labelStyle: const GaugeTextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    GaugeRange(
                      startValue: 500,
                      endValue: 1010,
                      color: AppColors.red,
                      label: 'DANGER',
                      startWidth: 25,
                      endWidth: 25,
                      labelStyle: const GaugeTextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(value: model.magnitude)
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(model.magnitude.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        angle: 90,
                        positionFactor: 0.5)
                  ])
            ]),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
