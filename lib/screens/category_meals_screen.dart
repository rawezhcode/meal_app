import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeal;
  bool loaded = false;
  
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
      final categoryId = routeArg['id'];
      categoryTitle = routeArg['title'];
      displayedMeal = widget.availableMeal.where((meal){
        return meal.categories!.contains(categoryId.toString());
      }).toList();
    super.didChangeDependencies();
  }

   void _removeMeal(String mealId) {
      setState(() {
         displayedMeal!.removeWhere((meal) => meal.id == mealId);
      });
   }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
       appBar: AppBar(title: Text(categoryTitle.toString())),
       body: ListView.builder(
         itemCount: displayedMeal!.length,
         itemBuilder: (BuildContext ctx, int index) {
         return MealItem(
           id: displayedMeal![index].id,
           title: displayedMeal![index].title.toString(),
           imageUrl: displayedMeal![index].imageUrl.toString(),
           duration: displayedMeal![index].duration,
           complexity: displayedMeal![index].complexity,
           affordability: displayedMeal![index].affordability,
          //  removeItem: _removeMeal,
           );
        },
       ),
    );
  }


}
