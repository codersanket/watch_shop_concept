import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_shop_concept/presentation/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
