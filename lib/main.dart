import 'package:flutter/material.dart';
import 'package:meals_recipes/models/settings.dart';
import 'package:meals_recipes/screens/meal_detail_screen.dart';
import "./screens/categories_screen.dart";
import "screens/categories_meals_screen.dart";
import "utils/app-routes.dart";
import "screens/tabs_screen.dart";

import 'screens/settings_screen.dart';

import "models/meals.dart";
import "data/dummy_data.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availabelMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availabelMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filtervegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;

        return !filterGluten &&
            !filterLactose &&
            !filtervegetarian &&
            !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
          primaryColor: Colors.purple,
          // canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.dark().textTheme.copyWith(
                  headline6: const TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
              ))),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(
              meals: _availabelMeals,
            ),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.SETTINGS: (context) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            )
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
          return const CategoriesScreen();
        });
      },
    );
  }
}
