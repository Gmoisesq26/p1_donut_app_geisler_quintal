import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String donutName;

  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutPrice,
      required this.donutColor,
      required this.donutName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: donutColor[100]),
    );
  }
}
