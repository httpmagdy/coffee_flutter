import 'package:flutter/foundation.dart';

class ModelCoffee {
  final String  title, image, aromaticProfile, aromaticNotes;
  final int id, intensity, acidity, bitterness, body, roasting;

  ModelCoffee({
    @required this.id,
    this.title,
    this.image,
    this.aromaticProfile,
    this.aromaticNotes,
    this.intensity,
    this.acidity,
    this.bitterness,
    this.body,
    this.roasting,
  });
}