import 'package:flutter/material.dart';
import 'ColorPair.dart';

class Palette {
  Palette._();

  static ColorPair getColor(String col){
    switch(col){
      case "Pink":
        return ColorPair(Colors.pink, Colors.white);
      case "Red":
        return ColorPair(Colors.red, Colors.white);
      case "Orange":
        return ColorPair(Colors.orange, Colors.black);
      case "Yellow":
        return ColorPair(Colors.yellow, Colors.black);
      case "Green":
        return ColorPair(Colors.green, Colors.white);
      case "Blue":
        return ColorPair(Colors.blue, Colors.white);
      case "Purple":
        return ColorPair(Colors.purple, Colors.white);
      case "Brown":
        return ColorPair(Colors.brown, Colors.white);
      case "Yellow Green":
        return ColorPair(Colors.lightGreenAccent[400], Colors.black);
      case "Light Orange":
        return ColorPair(Colors.orange[100], Colors.black);
      case "Light Green":
        return ColorPair(Colors.lightGreen[200], Colors.black);
      case "Light Blue":
        return ColorPair(Colors.lightBlue[100], Colors.black);
      case "Light Pink":
        return ColorPair(Colors.pink[200], Colors.black);
      case "Light Brown":
        return ColorPair(Color(0xEEDDC0AA), Colors.black);
      case "Glow":
        return ColorPair(Colors.lightGreen[100], Colors.black);
      case "Black":
        return ColorPair(Colors.black, Colors.white);
      case "White":
      default:
        return ColorPair(Colors.white, Colors.black);
    }
  }
}
