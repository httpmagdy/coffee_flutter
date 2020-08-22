import 'package:coffeeflutter/models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartProv with ChangeNotifier {
  Map<String, CartModel> _items = {
    '10': CartModel(
      id: '11',
      title: 'India',
      quantity: 1,
      price: 88.2,
      image: './assets/images/01.png',
    ),
  };

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  // CartModel findById(String prodId) {
  //   return _items.values.firstWhere((prod) => prod.id == prodId);
  // }

// List<Map<String, CartModel>> itemExistId(key) {
//     if (_items.keys.contains(key)) {
//       // if(_items.values. ){}
//       _items.values.firstWhere((cart) => cart.id == key);
//     }
//   }

  // itemExistId(key) {
  //   if (_items.keys.contains(key)) {
  //     // if(_items.values. ){}
  //     return _items.values.map((e) => e.quantity).toList();
  //   }
  // }

  // String itemExistId(key) {
  //   return _items.values.map((e) => e.quantity).first.toString();
  // }

  // double get totalAmount {
  //   double total = 0.0;
  //   for (var i = 0; i >= 0; i++) total += _items[i].price * _items[i].quantity;
  //   return total;
  // }

  String get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total.toStringAsFixed(2);
  }

  // String quant(productId) {
  //   String id = _items.keys.toList().firstWhere((key) => key == productId);
  //   return _items.values
  //       .firstWhere((element) => element.id == id)
  //       .quantity
  //       .toString();
  // }

  // int quan(String cartId, int quan) {
  //   return quan +=
  //       _items.values.firstWhere((cart) => cart.id == cartId).quantity;
  // }

  CartModel getQuan(String cartId) {
    return _items.values.firstWhere((cart) => cart.id == cartId);
  }

  void increaseQuan(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartModel(
          id: existingItem.id,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
          image: existingItem.image,
        ),
      );
    }
    notifyListeners();
  }

  void decreaseQuan(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartModel(
          id: existingItem.id,
          title: existingItem.title,
          quantity:
              (existingItem.quantity > 1) ? (existingItem.quantity - 1) : 1,
          price: existingItem.price,
          image: existingItem.image,
        ),
      );
    }
    notifyListeners();
  }

  void addItem(String productId, String title, double price, String image,
      [int quantity = 1]) {
    _items.putIfAbsent(
      productId,
      () => CartModel(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        quantity: quantity,
        image: image,
      ),
    );
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeItem(String prodId) {
    _items.remove(prodId);
    notifyListeners();
  }
}
