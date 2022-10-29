import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/Logic/AuthLogic.dart';
import 'package:plant_app/components/ListTileOfDrawer.dart';
import 'package:plant_app/Utilites/constants.dart';
import 'package:plant_app/screens/OrderScreen.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
//  Object userName(BuildContext context) async{
//     final userName=await Provider.of<Auth>(context,listen:false).getUserName();
//     return userName;
//   }
  void SelectFunc(BuildContext context,int index){
    switch (index){
      case 0:
      Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
      break;
      case 1: 
      Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
      break;
      case 2:
      Provider.of<Auth>(context,listen:false ).Logout();
      break;
      
    }
   
  }
  @override
  Widget build(BuildContext context) {
  
    return Drawer(
    
      child:Container(
        width: 300,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(180, 250, 250, 250),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(31, 38, 135, 0.4),
                blurRadius: 8.0,
              )
            ],
            border: Border(
                right: BorderSide(
              color: Colors.white70,
            ))),
        child: Stack(
          children: [
            SizedBox(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.white.withOpacity(0.2),
                    ])),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/712703916358537217/mcOketun_400x400.jpg'),
                        radius: 30.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(Provider.of<Auth>(context,listen:false).userName.toString())
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                    ListTileBuild(title:'Home Page',icon:Icons.home,func:()=>SelectFunc(context,1) ,),
                   ListTileBuild(title:'Orders',icon:Icons.shopping_bag,func:()=>SelectFunc(context,0) ,),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        title: Text("Settings"),
                      ),
                  ListTileBuild(title:'Log Out',icon:Icons.logout ,func:()=>SelectFunc(context,2) ,)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ), 
    );
  }
}
