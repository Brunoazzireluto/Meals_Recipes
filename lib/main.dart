import 'package:flutter/material.dart';
import "./screens/categories_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData(
    brightness: Brightness.dark
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.teal,
          secondary: Colors.lime
        )
      )
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.teal,
      //   fontFamily: "Raleway" ,
      //   textTheme: ThemeData.dark().textTheme.copyWith(
      //    titleMedium:  TextStyle(
      //      fontSize: 
      //    )
      //   )

      // ),
      home: const CategoriesScreen(),
    );
  }
}
