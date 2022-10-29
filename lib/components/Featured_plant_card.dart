import 'package:flutter/material.dart';
import 'package:plant_app/Logic/PlantsLogic.dart';
import 'package:plant_app/Utilites/constants.dart';
import 'package:plant_app/screens/PlantDetails/Plant_Details_Screen.dart';
import 'package:provider/provider.dart';
class FeaturePlantCard extends StatelessWidget {
  final String image;
  final String id;
  final String title;
FeaturePlantCard(this.id,this.image,[this.title]);

  @override
  Widget build(BuildContext context) {
   // final plantImage=Provider.of<Plants>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:()=>Navigator.of(context).pushNamed(PlantDetailScreen.routeName,arguments:id ),
     
          
         child: Container(
          margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
          ),
          width: size.width * 0.8,
          height: 185,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
              
            ),
          ),
          child:Stack(children:[ Positioned(
            top:30,
            left:20 ,
            child:Text(title==null?'':title,style:TextStyle(fontWeight:FontWeight.bold ,fontSize:16,color:Colors.black.withOpacity(0.6) ) ,))]) ) ,
        
        );
    
  }
}
