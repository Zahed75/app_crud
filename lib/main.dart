// import 'package:app_crud/Screen/ProductCreateScreen.dart';
import 'package:app_crud/Screen/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title:"Flutter App",
      home:ProductGridViewScreen()
    );
  }
}