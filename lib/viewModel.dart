import 'package:flutter/material.dart';
import 'dart:math';
import 'Disc.dart';

// A list of movies
final List<Disc> initialData = [
  Disc('Discraft', 'Zone', 'Light Pink', 174, 4, 3, 0, 3, true, true),
  Disc('Innova', 'Destroyer', 'Red', 173, 12, 5, -1, 3, true, true),
  Disc('Discraft', 'Hades', 'Light Blue', 172, 12, 5, -3, 2, true, true),
  Disc('Discraft', 'Hades', 'Light Brown', 172, 12, 5, -3, 2, true, true),
  Disc('Latitude 64', 'Rive', 'Light Pink', 174, 13, 5, 0, 3.5, true, true),
  Disc('Discraft', 'Buzzz', 'Light Green', 175, 5, 4, -1, 1, true, true),
  Disc('Latitude 64', 'Faith', 'Light Pink', 172, 2, 3, 0, 1, true, true),
  Disc('Latitude 64', 'Faith', 'Light Orange', 172, 2, 3, 0, 1, true, true),
  Disc('Latitude 64', 'Culverin', 'Orange', 174, 9, 5, -0.5, 3, true, true),
  Disc('Discraft', 'Captain\'s Raptor', 'Green', 174, 9, 3, 1, 4, true, true),
  Disc('Kastaplast', 'Svea', 'Glow', 175, 5, 5, -1, 0, true, true),
  Disc('Discraft', 'Zeus', 'Yellow', 174, 12, 5, -1, 3, true, false),
  Disc('Discraft', 'Zeus', 'Yellow Green', 174, 12, 5, -1, 3, true, false),
  Disc('Kastaplast', 'Berg', 'Orange', 174, 1, 1, 0, 2, false, false),
];

class BagViewModel with ChangeNotifier {
  // All movies (that will be displayed on the Home screen)
  final List<Disc> _discs = initialData;

  // Retrieve all discs
  List<Disc> get discs => _discs;

  // Discs not in bag
  final List<Disc> _owned = initialData.where((element) => element.owned && !element.inBag).toList();

  // Retrieve owned discs
  List<Disc> get owned => _owned;

  // Bagged discs (that will be shown on the FullBag screen)
  final List<Disc> _myBag = initialData.where((element) => element.inBag).toList();

  // Retrieve bagged discs
  List<Disc> get myBag => _myBag;

  // Recommended discs
  final List<Disc> _recs = initialData.where((element) => !element.owned).toList();

  // Retrieve recs
  List<Disc> get recs => _recs;

  // Get putters
  List<Disc> get putter => initialData.where((element) => element.speed < 4 && element.inBag).toList();

  // Get midranges
  List<Disc> get midrange => initialData.where((element) => element.speed >= 4 && element.speed < 7 && element.inBag).toList();

  // Get fairway drivers
  List<Disc> get fairway => initialData.where((element) => element.speed >= 7 && element.speed < 11 && element.inBag).toList();

  // Get distance
  List<Disc> get distance => initialData.where((element) => element.speed >= 11 && element.inBag).toList();

  // Limit to number of discs in bag
  static const int bagCapacity = 20;

  // Adding a disc to the bag
  void addToBag(Disc disc) {
    if(_myBag.length < bagCapacity) {
      disc.inBag = true;
      _myBag.add(disc);
      _owned.remove(disc);
      notifyListeners();
    }
  }

  // Removing a movie from the favorites list
  void removeFromBag(Disc disc) {
    _myBag.remove(disc);
    _owned.add(disc);
    notifyListeners();
  }

  void acquireDisc(Disc disc) {
    _owned.add(disc);
    _recs.remove(disc);
    notifyListeners();
  }
}