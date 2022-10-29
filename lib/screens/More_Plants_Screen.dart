import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/Logic/PlantsLogic.dart';
import 'package:plant_app/Models/Plant.dart';
import 'package:plant_app/Logic/PlantsLogic.dart';
import 'package:plant_app/components/Plant_Card.dart';
import 'package:plant_app/components/Recomended_Plant_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MorePlantScreen extends StatelessWidget {
  static const routeName = '/More-Screen';

  @override
  //design needs to change
  Widget build(BuildContext context) {
    final plant = Provider.of<Plants>(context, listen: false);
    // print( plant.items[1].imageUrl);
    return Scaffold(
      appBar: plant.buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: StaggeredGridView.countBuilder(
          crossAxisCount:4,mainAxisSpacing:4,
          crossAxisSpacing:4,
          staggeredTileBuilder:(index)=>StaggeredTile.fit(2),
          itemCount:plant.items.length,
          
          itemBuilder:(context,index){
            return PlantCard(
            id:plant.items[index].id,
      
             image:plant.items[index].imageUrl ,


            );


          
          },  ),
      )
    );
  }
}
