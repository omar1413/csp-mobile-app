
import 'package:csp_mobile_app/screens/Road_data.dart';
import 'package:csp_mobile_app/screens/subscriptions_management.dart';
import 'package:csp_mobile_app/screens/vehicle_management.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final String id ;
  final String title;
  final String image;
  
  Service({
    required this.id,
    required this.title,
    required this.image,
  });

   void selectedMeal(BuildContext ctx){
     if (id=="1"){
      Navigator.of(ctx).pushNamed(Vehiclemanagement.routeName, );}
     if (id=="2"){
      Navigator.of(ctx).pushNamed(Subscriptionsmanagement.routeName);}
     if (id=="3"){
     Navigator.of(ctx).pushNamed(RoudData.routeName);}
   
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(10),
      
      child: InkWell(
        onTap: ()=> selectedMeal(context),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Image.asset(image),
              decoration: BoxDecoration(    
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                       boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
              ),
          Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize:11 , fontWeight: FontWeight.bold , color: Colors.green),)
          ]
        ),
        ),
    );
  }
}