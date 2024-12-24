import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:app_airplane/source/utils/app_layout.dart';

class AppColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  const AppColumnLayout(
      {Key? key,
      required this.firstText,
      required this.secondText,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(firstText, style: Styles.headLineStyle3),
        SizedBox(height: AppLayout.getHeight(context,5)),
        Text(secondText, style: Styles.headLineStyle4),
      ],
    );
  }
}
