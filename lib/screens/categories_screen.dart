import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/widgets/category_item.dart';
 
 
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Meal'),),
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map((catData) => 
         CategoryItem(catData.id, catData.title, catData.color),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
        ),
      ),
    );
  }
}