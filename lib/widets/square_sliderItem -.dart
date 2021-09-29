import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../models/DummyHomeItem.dart';
import 'package:flutter/material.dart';
class Square_slider extends StatelessWidget {
  HomeItem item;
  Square_slider({required this.item });
  //final List<Colors> colors= [Colors.green[600]];
  @override
  Widget build(BuildContext context) {
     double height=MediaQuery.of(context).size.height;
     double width=MediaQuery.of(context).size.width;
    return Container(
     color: Colors.white,
     child: Stack
     (
       children:[
       Container(
        height: height*0.15,
        width: width*0.35,
        margin: const EdgeInsets.all(10),
        padding:const  EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(0.75),
              item.color,
               ],
            begin: Alignment.centerLeft,
            ),
          borderRadius: BorderRadius.circular(5),
        ), 
        child: Text(item.title,style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white),),
      ),
       Positioned(
         top: 75,
         right: 10,
         child:Text(item.amount.toString(),style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white , fontSize: 24),)),
       Positioned(
         top: 50,
         left: 10,
         child: Container(
          height: 80, 
           child: Image.asset("assets/images/download-speed.png")))
      ]
     ),
    );
  }
}