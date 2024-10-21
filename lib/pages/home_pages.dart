import 'package:flutter/material.dart';
import 'package:p1_donut_app_geisler_quintal/Utilis/my_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/burger_tab.dart';
import '../tab/smoothie_tab.dart';
import '../tab/pancakes_tab.dart';
import '../tab/pizza_tab.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List<Widget> myTabs = [
    //donutTab
    const MyTab(
      iconPath: 'lib/icons/donut.png',
      label: 'Donut',
    ),
    //burgerTab
    const MyTab(
      iconPath: 'lib/icons/burger.png',
      label: 'Burguer',
    ),
    //smoothieab
    const MyTab(
      iconPath: 'lib/icons/smoothie.png',
      label: 'Smoothie',
    ),
    //pancakeTab
    const MyTab(
      iconPath: 'lib/icons/pancakes.png',
      label: 'PanCake',
    ),
    //pizzaTab
    const MyTab(
      iconPath: 'lib/icons/pizza.png',
      label: 'Pizza',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(children: [
          //texto " I want to it"
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Row(
              children: [
                Text("I want to ", style: TextStyle(fontSize: 24)),
                Text("Eat",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ],
            ),
          ),
          //Tab bar
          TabBar(tabs: myTabs),
          //Tab bar view
          const Expanded(
              child: TabBarView(children: [
            DonutTab(),
            BurgerTab(),
            SmoothieTab(),
            PanCakesTab(),
            PizzaTab()
          ])
              //Total del carrito
              )
        ]),
      ),
    );
  }
}
