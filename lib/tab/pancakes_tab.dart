import 'package:flutter/material.dart';
import 'package:p1_donut_app_geisler_quintal/Car/car_model.dart';
import 'package:p1_donut_app_geisler_quintal/Utilis/pancakes_tile.dart';
import 'package:provider/provider.dart';

class PancakesTab extends StatelessWidget {
  // list of pizzas
  final List pancakeOnSale = [
    // [ pancakeFlavor, pancakePrice, pancakeColor, pancakeName ]
    ["Fences", "36", Colors.blue, "lib/Images_PanCakes/ballas_PanCakes.png"],
    ["CatCake", "45", Colors.red, "lib/Images_PanCakes/Cat_PanCakes.png"],
    [
      "Chocolate",
      "84",
      Colors.purple,
      "lib/Images_PanCakes/Chocle_PanCakes.png"
    ],
    [
      "Comb-Coffe",
      "95",
      Colors.brown,
      "lib/Images_PanCakes/comb_coffe_PanCakes.png"
    ],
    ["strawberry", "36", Colors.blue, "lib/Images_PanCakes/fresa_PanCakes.png"],
    ["Gorditas", "45", Colors.red, "lib/Images_PanCakes/gordis_PanCakes.png"],
    ["Ice", "84", Colors.purple, "lib/Images_PanCakes/Ice_PanCakes.png"],
    [
      "Big_Pizza",
      "95",
      Colors.brown,
      "lib/Images_PanCakes/Mora_azul_PanCakes.png"
    ],
  ];
  PancakesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pancakeOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return PancakesTile(
                  pancakesFlavor: pancakeOnSale[index][0],
                  pancakesPrice: pancakeOnSale[index][1],
                  pancakesColor: pancakeOnSale[index][2],
                  pancakesName: pancakeOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pancakeOnSale[index][0],
                      'price': pancakeOnSale[index][1],
                      'color': pancakeOnSale[index][2],
                      'image': pancakeOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${pancakeOnSale[index][0]} toggled');
                  },
                );
              },
            ),
          ),
          // Barrita inferior para mostrar el total del carrito
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cart.totalItems} Items | \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.pink, // Color del botón "View Cart"
                      ),
                      onPressed: () {
                        // Acción para ver el carrito
                        print('View Cart pressed');
                      },
                      child: const Text('View Cart'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
