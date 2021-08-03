import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widgets/meal_item.dart';
 
 
class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeal;
  FavoritesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
    
      return Center(
        child: Text("Not found Your Meal Favorites"),
      );
    }else{
       return ListView.builder(
         itemCount: favoriteMeal.length,
         itemBuilder: (BuildContext ctx, int index) {
         return MealItem(
           id: favoriteMeal[index].id,
           title: favoriteMeal[index].title.toString(),
           imageUrl: favoriteMeal[index].imageUrl.toString(),
           duration: favoriteMeal[index].duration,
           complexity: favoriteMeal[index].complexity,
           affordability: favoriteMeal[index].affordability,
           );
        },
       );
    }
  }
}