

import 'package:flutter/material.dart';
import 'package:plant_app/Logic/PlantsLogic.dart';
import 'package:plant_app/Models/Plant.dart';
import 'package:plant_app/Logic/PlantsLogic.dart';
import 'package:plant_app/components/search_item.dart';
import 'package:provider/provider.dart';

class SearchPlants extends SearchDelegate<String> {
  String name;
  SearchPlants(this.name);
  @override
  set query(String value) {
    value=name;
    super.query = value;
  }
@override
 ThemeData appBarTheme(BuildContext context) {
   final ThemeData theme = Theme.of(context);
   return theme.copyWith(
     primaryColor: theme.primaryColor.withOpacity(0.7),
     primaryIconTheme: theme.primaryIconTheme,
     primaryColorBrightness: theme.primaryColorBrightness,
     primaryTextTheme: theme.primaryTextTheme,
     inputDecorationTheme:InputDecorationTheme(border:InputBorder.none) 
   );
 }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
           query = '';
          },
          icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context,query);
    }, icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Plant> allPlants = Provider.of<Plants>(context)
        .items
        .where((element) => element.title.contains(query))
        .toList();
  return ListView.builder(
    itemCount:allPlants.length ,
    itemBuilder:(context,index)=>Text(allPlants[index].title));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
      final List<Plant> allSuggestedPlants = Provider.of<Plants>(context)
        .items
        .where((element) => element.title.toLowerCase().contains(query)|| element.title.contains(query) )
        .toList();
  return ListView.builder(
    itemCount:allSuggestedPlants.length ,
    itemBuilder:(context,index)=>SearchItem(allSuggestedPlants[index].id, allSuggestedPlants[index].imageUrl, allSuggestedPlants[index].title));
 
  }
}
