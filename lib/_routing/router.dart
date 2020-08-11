import 'package:flutter/material.dart';
import '../screens/details_screen.dart';
import '../screens/home_screen.dart';
import './routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case detailsScreenRoute:
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(product: settings.arguments),
      );
    // case cartScreenRoute:
    //   return MaterialPageRoute(builder: (context) => FruitAppCartScreen());
    //   break;
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
