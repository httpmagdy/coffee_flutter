import 'package:coffeeflutter/_routing/routes.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import 'package:flutter/material.dart';
import '_routing/router.dart';
import 'providers/products_prov.dart';
import 'screens/details_screen.dart';

void main() {
  runApp(Coffee());
}

class Coffee extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProv(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: ChangeNotifierProvider(
        //   create: (ctx) => ProductsProv(),
        //   child: HomeScreen(),
        // ),
        onGenerateRoute: generateRoute,
        initialRoute: homeScreenRoute,
      ),
    );
  }
}
