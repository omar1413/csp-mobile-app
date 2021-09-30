import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../models/DummyHomeItem.dart';
import 'package:flutter/material.dart';
class Cirular_slider extends StatelessWidget {
  HomeItem item;
  Cirular_slider({required this.item});
  //final List<Colors> colors= [Colors.green[600]];
  @override
  Widget build(BuildContext context) {
     double height=MediaQuery.of(context).size.height;
     double width=MediaQuery.of(context).size.width;
    return Container(
      
     child: Stack
     (
       children:[
        SleekCircularSlider(
         appearance: CircularSliderAppearance(
           infoProperties:InfoProperties(
             bottomLabelText: item.type,
             topLabelText: item.subtitle,
             topLabelStyle: TextStyle(color:Colors.white54),
             bottomLabelStyle: TextStyle(color:Colors.white54),
           ) ,
           size: 120,
           animationEnabled :true,
           //spinnerMode: true,
           customColors: CustomSliderColors(progressBarColor:item.color, trackColor: Colors.grey[300] ),
           customWidths: CustomSliderWidths(progressBarWidth:5,)),
            min: 0,
            max: 200,
            initialValue: item.amount.toDouble(),
            
         ),
         Positioned(
           left: 25,
           top:  120,
           child: Text(
              item.title,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
                ),
             ),
         ),
      ]
     ),
    );
  }
}