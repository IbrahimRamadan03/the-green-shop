import 'package:flutter/material.dart';
import 'package:plant_app/components/detailPageButton.dart';
import 'package:plant_app/components/rounded_button.dart';
import 'package:plant_app/screens/PlantDetails/Expandable.dart';
import 'package:plant_app/screens/PlantDetails/Header.dart';
import 'package:plant_app/screens/PlantDetails/details.dart';



class PlantDescriptionScreen extends StatelessWidget {
  static const RouteName = '/Plant-description';
  @override
  Widget build(BuildContext context) {
    final plant=ModalRoute.of(context).settings.arguments as Map;
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      // appBar:AppBar() ,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
        
              children: [
                Header(plant['imageUrl']),
                DetailsWidget(plant['title']),
                SizedBox(height: 15),
                Divider( indent: 15, endIndent: 15),
                Expandable(description:plant['description']),
                Divider(color:Colors.black, indent: 15, endIndent: 15),
            
                // Divider(color: Colors.black, indent: 15, endIndent: 15),
               
                // SizedBox(height: 30),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                       crossAxisAlignment:CrossAxisAlignment.start ,
                       children: [
                       
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text('Rate :',style:TextStyle(fontSize:25 ,fontWeight:FontWeight.bold )),
                       ),
                     
                Container(
                    alignment:Alignment.topCenter ,
                       width:MediaQuery.of(context).size.width*0.3,
                       margin:EdgeInsets.only(bottom:35),
                     
                       height:50 ,
                       child: ListView.builder(
                          scrollDirection:Axis.horizontal ,
                         itemCount:5 ,
                         itemBuilder:(ctx,indx)=>Icon(Icons.star,color:Colors.amber ,)),
                   ),
                 
                ],),
                   ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: RoundedButton(title:plant['title'],plantId:plant['id'],imageUrl:plant['imageUrl'],price:plant['price'] ,),
                ),
             
              ],
            ),
          ),
        ),
      
    );
  }
}
