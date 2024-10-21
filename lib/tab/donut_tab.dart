import 'package:flutter/material.dart';
import 'package:p1_donut_app_geisler_quintal/Utilis/donut_tile.dart';

class DonutTab extends StatelessWidget {
  // list of donuts
  final List donutsOnSale = const [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Watter Donut", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Cherry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape_2", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Cacao", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];
  const DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Delegate sirve para organizar los widgets en la cuadricula
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.7),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          donutName: donutsOnSale[index][3],
        );
      },
    );
  }
}
