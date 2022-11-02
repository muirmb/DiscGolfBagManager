import 'package:flutter/material.dart';
import 'dart:math';
import 'Disc.dart';

// A list of movies
final List<Disc> initialData = [
  Disc('Discraft', 'Zone', 'Pink', 174, 4, 3, 0, 3),
  Disc('Innova', 'Destroyer', 'Red', 173, 12, 5, -1, 3),
  Disc('Discraft', 'Zeus', 'Yellow', 174, 12, 5, -1, 3),
  Disc('Kastaplast', 'Berg', 'Orange', 174, 1, 1, 0, 2)
];

class BagViewModel with ChangeNotifier {
  // All movies (that will be displayed on the Home screen)
  final List<Disc> _discs = initialData;

  // Retrieve all discs
  List<Disc> get discs => _discs;

  // Discs not in bag
  final List<Disc> _owned = [];

  // Retrieve owned discs
  List<Disc> get owned => _owned;

  // Bagged discs (that will be shown on the FullBag screen)
  final List<Disc> _myBag = initialData;

  // Retrieve bagged discs
  List<Disc> get myBag => _myBag;

  // Adding a disc to the bag
  void addToBag(Disc disc) {
    _myBag.add(disc);
    notifyListeners();
    _owned.remove(disc);
  }

  // Removing a movie from the favorites list
  void removeFromBag(Disc disc) {
    _myBag.remove(disc);
    notifyListeners();
    _owned.add(disc);
  }
}