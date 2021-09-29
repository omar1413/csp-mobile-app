//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:csp_mobile_app/widets/carouselCircle_slider.dart';
import 'package:csp_mobile_app/widets/carouselSquare_slider.dart';
import 'package:flutter/material.dart';
import '../widets/cirular_sliderItem.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class homeScreen extends StatelessWidget {
Widget _text(String str ){
  return Text(
  str,
  textAlign: TextAlign.end,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
    ),
);
}
Widget _textField(String str){
  return  Container(
            height: 40,
            width: 300,
            margin:EdgeInsets.only(bottom: 10),
            child: TextField(
              textAlign: TextAlign.end,
              cursorColor: Colors.green[600],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius : BorderRadius.all(Radius.circular(50.0))
                  ),
                labelText: str,  
              ),
            ),
          );
}
Widget _textBtn(String str){
  return Container(
          height: 35,
          alignment: Alignment.topLeft,
          // padding: EdgeInsets.symmetric(horizontal:),
          child: TextButton(
              onPressed: () {},
              child: Text(str,
              style: TextStyle(
                      color: Colors.green[600],
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal
                    ),)),
        );
}
  
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
          child:Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          index: 2,
          backgroundColor: Colors.white,
          color: Colors.green,
          buttonBackgroundColor:Colors.green[900],
          items: const <Widget>[
            Icon(Icons.qr_code, size: 30),
            Icon(Icons.account_balance_wallet_outlined, size: 30),
            Icon(Icons.home, size: 35),
            Icon(Icons.help_outline_rounded, size: 30),
            Icon(Icons.settings, size: 30),
           /* ImageIcon(AssetImage("assets/images/settings.png"),size: 30,),
            ImageIcon(AssetImage("assets/images/help.png")),
            ImageIcon(AssetImage("assets/images/home-active.png")),
            ImageIcon(AssetImage("assets/images/qr-code-scan.png")),
            ImageIcon(AssetImage("assets/images/wallet-active.png")),*/
            
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      body:Container(
      color: Colors.pink,
      child: Column(
        children:[
           Container(
             color: Colors.orange,
             width: width,
             //height: height*0.2,
             child: Stack(
                children: [
                  Container(
                      child:Image.asset('assets/images/login.png' , fit: BoxFit.fill),
                      height:height * 0.4,
                      width:width,
                      decoration: BoxDecoration(    
                        color: Colors.green[700],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0),
                        ),
                       boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
               Container(
                 padding: EdgeInsets.only(top:70),
                 child: CarouselCircle())      
             ]),
           ),
           CarouselSquare(),
        ]
        ), 
      ),
          )
    );
  }
}