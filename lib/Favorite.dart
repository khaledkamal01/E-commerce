import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        "Favorite",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}
