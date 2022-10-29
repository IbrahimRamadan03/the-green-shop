import 'package:flutter/material.dart';
import 'package:plant_app/Logic/CartLogic.dart';
import 'package:plant_app/Models/Cart.dart';
import 'package:plant_app/Models/Plant.dart';
import 'package:plant_app/Utilites/constants.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String imageUrl; 
  CartItemWidget({this.id,this.title,this.price,this.quantity,this.imageUrl});
  Widget _buttonBuilder(IconData sign,BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
          onTap: (){
            if(sign==Icons.add_circle_outlined){
    
              Provider.of<Cart>(context,listen:false ).addItem(id, price, title, imageUrl);
            }
            if(sign==Icons.remove_circle_outlined)
            {
              
              Provider.of<Cart>(context,listen:false ).removeSingelItem(id);
            }
          },
          child: Icon(
            sign,
            color: Colors.black,
            size: 30,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction){
    Provider.of<Cart>(context,listen:false).deletedItem(id);
      },
     
        background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        )),
      child: Container(
        decoration:BoxDecoration(borderRadius:BorderRadius.only(topRight:Radius.circular(15),bottomRight:Radius.circular(15)  ),color:Colors.green[100] , ) ,

        width:MediaQuery.of(context).size.width*0.9 ,
        padding:EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 170,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageUrl))),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
             
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height:40,),
                    Row(
                   
                      children: [
                      
                      Text('Unit Price :',style:TextStyle(fontWeight:FontWeight.bold,fontSize:15  ) ,),
                      SizedBox(width:70 ,),
                    Text('\$$price',style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.bold  ),),
                    ],),
                          SizedBox(height:40,),
                   
                           Row(
                             
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if(Provider.of<Cart>(context,listen:false).items[id].quantity>1)
                      _buttonBuilder(Icons.remove_circle_outlined,context),
                         SizedBox(width:10),
                      Text(
                        quantity.toString(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width:10),
                      _buttonBuilder(Icons.add_circle_outlined,context),
                    ],
                  )
    
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                
                  SizedBox(
                    height: 18,
                  ),
             
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
