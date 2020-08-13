import 'package:coffeeflutter/_routing/routes.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '_routing/router.dart';
import 'providers/products_prov.dart';

void main() {
  runApp(Coffee());
}

class Coffee extends StatelessWidget {
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
