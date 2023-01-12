import 'package:flutter/material.dart';
import 'calculator_page/calculator.dart';

main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
//comment
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home:Calculator(),
    );
  }
}
