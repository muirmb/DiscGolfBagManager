import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static MaterialColor getColor(String col){
    switch(col){
      case "Pink":
        return Colors.pink;
      case "Red":
        return Colors.red;
      case "Orange":
        return Colors.orange;
      case "Yellow":
        return Colors.yellow;
      case "Green":
        return Colors.green;
      case "Blue":
        return Colors.blue;
      case "Purple":
        return Colors.purple;
      case "Brown":
        return Colors.brown;

    }
    return Colors.pink;
  }
}
