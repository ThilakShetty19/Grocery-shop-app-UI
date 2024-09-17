import 'package:flutter/material.dart';
import 'package:grocery_shopping_app/screens/header_part.dart';
import 'package:grocery_shopping_app/screens/item_display.dart';
import 'package:grocery_shopping_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.green[200],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            )
          ]),
      body: ListView(
        children:  const [
          SizedBox(
            height: 15,
          ),
          HeaderPart(),
          ItemDisplay()
        ],
      ),
    );
  }
}
