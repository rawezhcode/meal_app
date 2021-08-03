import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/screens/categories_screen.dart';
import 'package:meal_application/screens/favorites_screen.dart';
import 'package:meal_application/widgets/main_drawer.dart';
 
 
class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeal;

  TabsScreen(this.favoriteMeal);
    
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

     late List<Map<String, Object>> _page;
     @override
     void initState() { 
       _page = [
          {
            'page': CategoriesScreen(),
            'title': 'Categoreis',
          },
          {
            'page': FavoritesScreen(widget.favoriteMeal),
            'title': 'Favorites',
          },
        ];
       super.initState();
     }

    int _selectIndexPage = 0;
    void _selectPage(int value) {
      setState(() {
        _selectIndexPage = value;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_page[_selectIndexPage]['title'] as String),),
      body: _page[_selectIndexPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectIndexPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categoreis"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}