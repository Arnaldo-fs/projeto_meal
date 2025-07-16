import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 48, 12, 24),
          title: Text('Vamos Cozinhar?'),
          bottom: TabBar(
            labelColor: Colors.pink, // Cor do ícone/texto selecionado
            unselectedLabelColor:
                Colors.white, // Cor dos ícones/textos não selecionados
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
