import 'package:coffeeflutter/models/coffee.dart';
import 'package:flutter/foundation.dart';
import '../dummy_data.dart';

// abstract class DataPath {
//   static Object ispiresoNapoli = productsData['ispiresoNapoliCoffee'];
//   static Object masterOrigin = productsData['masterOriginCoffee'];
// }

class ProductsProv with ChangeNotifier {
//  final ispiresoNapoli = productsData['ispiresoNapoliCoffee'];
//  final masterOrigin = productsData['masterOriginCoffee'];

  // DataPath prodData1 = DataPath.ispiresoNapoli;
  // DataPath prodData2 = DataPath.masterOrigin;

  // ModelCoffee findByID(id) {
  //   return productsData.firstWhere((prod) => prod.id == id);

  //   // return data.firstWhere((prod) => prod.id == id);
  // }

  // ModelCoffee masterFindByID(id) {
  //   return productsData['masterOriginCoffee']
  //       .firstWhere((prod) => prod.id == id);
  // }

//  final ispiresoNapoli = productsData['ispiresoNapoliCoffee'];

  List<ModelCoffee> get data {
    return [...productsData['ispiresoNapoliCoffee']];
  }

  List<ModelCoffee> get data2 {
    return [...productsData['masterOriginCoffee']];
  }

  // List<ModelCoffee> get masterOriginCoffee {
  //   return [...productsData];
  // }
}
