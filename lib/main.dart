import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:my_web/pages/home/homepage.dart';
import 'package:my_web/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PT. GSP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: AppRouter().appRoute,
      ),
    );
  }
}
