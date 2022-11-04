import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static Color? getColor(String col){
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
      case "Light Green":
        return Colors.lightGreen[200];
      case "Light Blue":
        return Colors.lightBlue[100];
      case "Light Pink":
        return Colors.pink[200];
      case "Glow":
        return Colors.lightGreen[100];
      case "Black":
        return Colors.black;
      case "White":
      default:
        return Colors.white;
    }
  }
}
