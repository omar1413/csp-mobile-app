import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  "${AuthApi.authedUser?.username ?? ""}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                // Text(
                //   "RFID 10007763",
                //   style: TextStyle(
                //       fontWeight: FontWeight.normal, color: Colors.white70),
                // ),
              ],
            ),
            SizedBox(
              width: 150,
            ),
            RotatedBox(
              quarterTurns: 2,
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
                icon: const Icon(
                  Icons.logout,
                  size: 20,
                  color: Colors.white54,
                ),
              ),
            )
          ],
        ),
        Divider(
          color: Colors.white,
          thickness: 0.5,
        )
      ],
    );
  }
}
