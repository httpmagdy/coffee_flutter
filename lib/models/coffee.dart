import 'package:flutter/foundation.dart';

class ModelCoffee with ChangeNotifier {
  final String id, title, image, aromaticProfile, aromaticNotes, description;
  final double price;
  final int intensity, acidity, bitterness, body, roasting;

  ModelCoffee({
    @required this.id,
    this.title,
    this.image,
    this.aromaticProfile,
    this.aromaticNotes,
    this.description,
    this.price,
    this.intensity,
    this.acidity,
    this.bitterness,
    this.body,
    this.roasting,
  });
}
