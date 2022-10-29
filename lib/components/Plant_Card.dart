import 'package:flutter/material.dart';
import 'package:plant_app/screens/PlantDetails/Plant_Details_Screen.dart';

class PlantCard extends StatelessWidget {
  final String image, id;

  PlantCard({this.id, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(PlantDetailScreen.routeName, arguments: id),
      child: Card(
        child: Image.network(image),
      ),
    );
  }
}
