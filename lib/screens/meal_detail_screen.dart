import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
 

class MealDetailScreen extends StatelessWidget {
    static const routeName = 'meal_detail';
    final Function toggleFavorite;
    final Function isFavorite;

    MealDetailScreen(this.toggleFavorite,this.isFavorite);

    Widget buildSectionTitle(BuildContext context, String title) {
     return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(title,style: Theme.of(context).textTheme.title,),
     );
    }
   
    Widget buildContainer(Widget child) {
     return Container(
            height: 200,
            width: 330,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
      );
    }
   
  @override
  Widget build(BuildContext context) {

    final routeArg = ModalRoute.of(context)!.settings.arguments as String;
    final mealId = routeArg;  
    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId.toString());
    
    return Scaffold(
      appBar: AppBar(title: Text(mealDetail.title.toString()),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(mealDetail.imageUrl.toString(),fit: BoxFit.cover,),
            ),
            buildSectionTitle(context, "Ingradients"),
            buildContainer(
              ListView.builder(
                  itemCount: mealDetail.ingredients!.length,
                  itemBuilder: (BuildContext ctx, int index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        mealDetail.ingredients![index],
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ),
                ),
            ),
            buildSectionTitle(context, "Steps"),
             buildContainer(
              ListView.builder(
                  itemCount: mealDetail.steps!.length,
                  itemBuilder: (BuildContext ctx, int index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index+1}"),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mealDetail.steps![index],
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: (){Navigator.of(context).pop(mealId);},
        onPressed: ()=>toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star: Icons.star_border
        ),
      ),
    );
  }
}