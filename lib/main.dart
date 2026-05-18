import 'package:flutter/material.dart';

void main(){
  runApp(const RobinFoodApp());
}

class RobinFoodApp extends StatelessWidget{
const RobinFoodApp({super.key});


@override
Widget build(BuildContext context){
return MaterialApp(
  title: 'Robin Food',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    fontFamily: 'Arial',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF9800)
    ),
  ),
  home: const HomeScreen(),
);
}

}


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: child)
  }
}