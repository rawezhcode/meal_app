import 'package:flutter/material.dart';
import 'package:meal_application/widgets/main_drawer.dart';
 
 
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilter;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.currentFilter, this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   bool? _glutenFree =false;
   bool? _lactoseFree =false;
   bool? _vegan =false;
   bool? _vegetarian =false;

   @override
   void initState() { 
      _glutenFree =widget.currentFilter['gluten'];
      _lactoseFree =widget.currentFilter['lactose'];
      _vegan =widget.currentFilter['vegan'];
      _vegetarian =widget.currentFilter['vegetarian'];
     super.initState();
   }

   Widget buildSwitchListTiles(String title, String subtitle, bool value,Function(bool) updateValue){
     return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: updateValue,
    );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
             icon:  Icon(Icons.save),
             onPressed: (){
               final Map<String, bool> selectedFilter = {
                  'gluten': _glutenFree!,
                  'lactose': _lactoseFree!,
                  'vegan': _vegan!,
                  'vegetarian': _vegetarian!,
                };
               widget.saveFilter(selectedFilter); 
             }, 
          )
        ],
        ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",style: Theme.of(context).textTheme.title,),
          ),
          Expanded(
            child:ListView(
              children: [
                buildSwitchListTiles(
                    "Gluten_Free",
                    "Only include gluten_free meals",
                    _glutenFree as bool, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                    print(newValue);
                  });
                }),
                buildSwitchListTiles(
                    "Lactose",
                    "Only include Lactose_free meals",
                    _lactoseFree as bool, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                    print(newValue);
                  });
                }),
                buildSwitchListTiles(
                    "Vegan",
                    "Only include Vegan_free meals",
                    _vegan as bool, (newValue) {
                  setState(() {
                    _vegan = newValue;
                    print(newValue);
                  });
                }),
                buildSwitchListTiles(
                    "Vegetarian",
                    "Only include Vegetarian_free meals",
                    _vegetarian as bool, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                    print(newValue);
                  });
                }),

              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}