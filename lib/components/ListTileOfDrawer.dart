import 'package:flutter/material.dart';
import 'package:plant_app/Utilites/constants.dart';

class ListTileBuild extends StatelessWidget {
  final String title;
  final IconData icon;
  //final String RouteName
 VoidCallback func;
  ListTileBuild({this.title, this.icon,this.func});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap:func,
      hoverColor: Colors.white70,
      leading: Icon(
     icon,
      color:Colors.black54 ,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black,),
      ),
    );
  }
}
