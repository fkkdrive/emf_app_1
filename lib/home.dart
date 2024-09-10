import 'package:emf_app/models/magnitude_provider.dart';
import 'package:emf_app/pages/visuals.dart';
import 'package:emf_app/utils/colors.dart';
import 'package:emf_app/widgets/main_reading.dart';
import 'package:emf_app/widgets/meter_reading.dart';
import 'package:emf_app/widgets/xyz_reading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40.0,
                ),
                const MainReading(),
                const SizedBox(height: 10),
                const Text('Update Interval'),
                const XYZReading(),
                const MeterReading(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side:
                                        const BorderSide(color: Colors.white))),
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Visuals()));
                        },
                        child: const Text('Visualize')),
                    Consumer<MagnitudeProvider>(
                      builder: (context, model, child) => ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: const BorderSide(
                                          color: Colors.white))),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor)),
                          onPressed: () {
                            model.changeValues();
                          },
                          child: const Text('Start')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
