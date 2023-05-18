import 'package:flutter/material.dart';

import 'Chat.dart';
import 'Favorite.dart';
import 'Home.dart';
import 'Profile.dart';

class test extends StatefulWidget {
  const test ({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  int currentIndex = 0;
  List screens = [Home(), Favorite(), Chat(), Profile()];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.storefront_sharp), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}
