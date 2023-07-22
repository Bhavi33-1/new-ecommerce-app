import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newapp/widgets/widgets.dart';
import 'package:newapp/models/modals.dart';
import 'package:newapp/models/category_model.dart';

class SplashScreen extends StatelessWidget {
  // const CatalogScreen({Key? key}) : super(key: key);
  static const String routeName = '/Splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }



  @override
  Widget build(BuildContext context) {
  Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: NetworkImage('https://comps.canstockphoto.com/cute-baby-donkey-cartoon-vector-clip-art_csp17233512.jpg'),
              width: 290,
              height: 290,
            ),
          ),
          SizedBox(height: 30),
          Container(
            color: Colors.pinkAccent.shade100,
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
              vertical: 10,
            ),
            child: Text(
              'Enriched Milk',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}