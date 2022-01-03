import 'package:flutter/material.dart';

class LocChartScreen extends StatelessWidget {
  const LocChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: Text(
          'Your location Screen',
        ),
      ),
    );
  }
}
