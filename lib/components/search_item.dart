import 'package:flutter/material.dart';
import 'package:plant_app/components/Featured_plant_card.dart';
import 'package:plant_app/Utilites/constants.dart';

class SearchItem extends StatelessWidget {

final String id;
final String image;
final String title;
SearchItem(this.id,this.image,this.title);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right:kDefaultPadding ),
      child: SizedBox(
          height:250,
          width:200 ,
          child: FeaturePlantCard(id,image,title)),
    );
    
  }
}