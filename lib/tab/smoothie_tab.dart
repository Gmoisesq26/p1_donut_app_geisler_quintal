import 'package:flutter/material.dart';
import 'package:p1_donut_app_geisler_quintal/Car/car_model.dart';
import 'package:p1_donut_app_geisler_quintal/Utilis/smoothie_tile.dart';
import 'package:provider/provider.dart';

class SmoothieTab extends StatelessWidget {
  // list of pizzas
  final List smoothieOnSale = [
    // [ pancakeFlavor, pancakePrice, pancakeColor, pancakeName ]
    ["Rainbown", "76", Colors.blue, "lib/images_s/arcoiris.png"],
    [
      "Ice_Coffe",
      "45",
      Colors.red,
      "lib/images_s/chocolate-ice-cream-milkshake.png"
    ],
    ["Caramel", "54", Colors.purple, "lib/images_s/f.png"],
    ["Red fruits", "55", Colors.brown, "lib/images_s/fondo.png"],
    ["Green", "36", Colors.blue, "lib/images_s/Verde.png"],
    ["mocha-cappuccino", "45", Colors.red, "lib/images_s/mocha-cappuccino.png"],
    ["Loves", "60", Colors.purple, "lib/images_s/OIP.png"],
    ["strawberry with pieces", "75", Colors.brown, "lib/images_s/fresa_t.png"],
  ];
  SmoothieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: smoothieOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return SmoothieTile(
                  smoothiesFlavor: smoothieOnSale[index][0],
                  smoothiesPrice: smoothieOnSale[index][1],
                  smoothiesColor: smoothieOnSale[index][2],
                  smoothiesName: smoothieOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': smoothieOnSale[index][0],
                      'price': smoothieOnSale[index][1],
                      'color': smoothieOnSale[index][2],
                      'image': smoothieOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${smoothieOnSale[index][0]} toggled');
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
