import 'package:flutter/material.dart';
import 'ColorPair.dart';

class Disc {
  String make;
  String model;
  String color;
  int weight;
  double speed;
  double glide;
  double turn;
  double fade;
  bool owned;
  bool inBag;

  Disc(this.make, this.model, this.color, this.weight, this.speed, this.glide, this.turn, this.fade, this.owned, this.inBag);
}