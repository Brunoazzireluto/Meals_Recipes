import "package:flutter/material.dart";
import 'package:meals_recipes/components/main_drawer.dart';
import 'categories_screen.dart';
import "favorite_screen.dart";

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [
    const CategoriesScreen(),
    const FavoriteScreen()
  ];

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  _selecteScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_titles[_selectedScreenIndex])),
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.teal,
        currentIndex: _selectedScreenIndex,
        onTap: _selecteScreen,
        backgroundColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: "Categorias"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded), label: "Favoritos"),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
