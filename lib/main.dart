import 'package:ecommerce_test/core/theme/theme_class.dart';
import 'package:ecommerce_test/ui/screens/home_screen/home_screen.dart';
import 'package:ecommerce_test/ui/screens/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
