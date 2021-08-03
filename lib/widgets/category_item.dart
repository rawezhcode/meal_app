import 'package:flutter/material.dart';
import 'package:meal_application/screens/category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

  const CategoryItem(this.id, this.title, this.color);

   void selectCategory(BuildContext ctx) {
     Navigator.of(ctx).pushNamed(
       CategoryMealsScreen.routeName,
       arguments: {
          'id': id,
          'title': title, 
       }
      );
   }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title.toString(),style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 6),
          )],
          color: color,
          gradient: LinearGradient(
            colors: [
              color!.withOpacity(0.7),
              color!
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}