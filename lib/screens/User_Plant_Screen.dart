import 'package:flutter/material.dart';
import 'package:plant_app/Logic/AuthLogic.dart';
import 'package:provider/provider.dart';
class UserPlantScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
   // final data=Provider.of<Auth>(context,listen:false ).userName;
    return Scaffold(body:Center(child:Text('user data can be modified here') ,) ,);
  }
}