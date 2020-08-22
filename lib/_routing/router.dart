import 'package:flutter/material.dart';
import './routes.dart';
import '../screens/details_screen.dart';
import '../screens/home_screen.dart';
import '../screens/cart_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
      break;
    case detailsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(product: settings.arguments),
      );
      break;
    case cartScreenRoute:
      return MaterialPageRoute(builder: (context) => CartScreen());
      break;
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
