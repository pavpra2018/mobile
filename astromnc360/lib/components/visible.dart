import 'package:flutter/material.dart';

class Visible extends StatelessWidget {
  final bool showSpinner;
  final Color colors;
  const Visible({Key? key, required this.showSpinner, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showSpinner,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          colors,
        ),
        strokeWidth: 4.0,
      ),
    );
  }
}
