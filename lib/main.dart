import 'package:flutter/material.dart';
import 'package:meals_recipes/screens/meal_detail_screen.dart';
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
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
          primaryColor: Colors.purple,
          // canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.dark().textTheme.copyWith(
                  headline6: const TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
              ))),
      routes: {
        AppRoutes.HOME: (context) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: ((context) => const MealDetailScreen())
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == "/algo") {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(builder: (_) {
      //       return CategoriesScreen();
      //     });
      //   }
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoriesScreen();
        });
      },
    );
  }
}
