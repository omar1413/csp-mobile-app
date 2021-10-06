import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      //width:200,
      //color: Colors.red,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                //color: Colors.tealAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Image.asset("assets/images/user.png"),
            ),
            Column(
              children: [
                Text(
                  "${AuthApi.userName}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                Text(
                  "RFID 10007763",
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.white70),
                ),
              ],
            ),
            SizedBox(
              width: 150,
            ),
            Icon(
              Icons.notifications_active,
              size: 20,
              color: Colors.white54,
            ),
          ],
        ),
        Divider(
          color: Colors.white,
          thickness: 0.5,
        )
      ]),
    );
  }
}
