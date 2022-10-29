import 'package:flutter/material.dart';
import 'package:plant_app/Models/Order.dart';
import 'package:plant_app/Utilites/constants.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;
  // final int lengthOfOrderBox;
  

  OrderItemWidget(this.order);
 

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  bool _isExpanded=false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width:350 ,
          height:_isExpanded?300:70,
          decoration:BoxDecoration(color:kPrimaryColor.withOpacity(0.2) ) ,
       
            child: Column(
              children:[ Align(
                alignment:Alignment.topCenter ,
                child: Row(
                   mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  // crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.order.timing),
                    ),
                  IconButton(onPressed:(){
                        setState(() {
                          _isExpanded=!_isExpanded;
                        });
                      },
                      icon:Icon(_isExpanded?Icons.expand_less:Icons.expand_more )),
                    
              
                  ],
                ),
              ),
             if( _isExpanded) Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Align(
                   alignment:Alignment.centerLeft ,
                   child:Container(
                     width:350,
                     height:200 ,
                     child: ListView(children:widget.order.plantsToBeShipped.map((e) => Row
                     (
                       mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      
                       children: [
                       Text(e.title,style:TextStyle(fontSize:20,fontWeight:FontWeight.bold  ) ,),
                      
                       Text('X'+e.quantity.toString())
                   
                   
                     ])).toList(),),
                   )
                 ),
               ),
             
              ]),
          ) ,
        
      ),
    );
}
}