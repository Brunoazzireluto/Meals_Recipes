import 'package:flutter/material.dart';
import "./screens/categories_screen.dart";
import "screens/categories_meals_screen.dart";
import "utils/app-routes.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
          primaryColor: Colors.purple,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
              ))),
      routes: {
        AppRoutes.HOME: (context) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => const CategoriesMealsScreen(),
      },
    );
  }
}
