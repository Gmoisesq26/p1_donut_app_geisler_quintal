import 'package:flutter/material.dart';
import 'package:p1_donut_app_geisler_quintal/Car/car_model.dart';
import 'package:p1_donut_app_geisler_quintal/Utilis/burger_tile.dart';
import 'package:provider/provider.dart';

class BurgerTab extends StatelessWidget {
  // list of pizzas
  final List burgersOnSale = [
    // [ pancakeFlavor, pancakePrice, pancakeColor, pancakeName ]
    ["Vegan", "36", Colors.blue, "lib/Images_Burger/Vegana.png"],
    ["Kangre_burger", "45", Colors.red, "lib/Images_Burger/Kangre_burger.png"],
    ["Monster", "84", Colors.purple, "lib/Images_Burger/Monster.png"],
    ["Doble_Chiken", "95", Colors.brown, "lib/Images_Burger/Doble_Chiken.png"],
    ["Chiken_Crunch", "36", Colors.blue, "lib/Images_Burger/Chken_Crunch.png"],
    ["Chiken", "45", Colors.red, "lib/Images_Burger/Chiken.png"],
    [
      "Mini Burger",
      "35",
      Colors.purple,
      "lib/Images_Burger/hamburger-snack.png"
    ],
    ["Big Burger", "95", Colors.brown, "lib/Images_Burger/Big.png"],
  ];
  BurgerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: burgersOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return BurgerTile(
                  burgerFlavor: burgersOnSale[index][0],
                  burgerPrice: burgersOnSale[index][1],
                  burgerColor: burgersOnSale[index][2],
                  burgerName: burgersOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': burgersOnSale[index][0],
                      'price': burgersOnSale[index][1],
                      'color': burgersOnSale[index][2],
                      'image': burgersOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${burgersOnSale[index][0]} toggled');
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
