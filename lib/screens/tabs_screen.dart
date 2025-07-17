import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.pink,
        unselectedItemColor: const Color.fromARGB(255, 109, 0, 56),
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 255, 199, 231),
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 255, 199, 231),
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
