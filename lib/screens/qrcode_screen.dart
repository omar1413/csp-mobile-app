// ignore_for_file: file_names

import '../widets/custom_text_line.dart';
import 'package:flutter/material.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

/// This is the private State class that goes with QrCodeScreen.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    // late AnimationController controller;

    @override
    void initState() {
      // controller = AnimationController(
      //   vsync: this,
      //   duration: const Duration(seconds: 5),
      // )..addListener(() {
      //     setState(() {});
      //   });
      // controller.repeat(reverse: true);
      super.initState();
    }

    @override
    void dispose() {
      // controller.dispose();
      super.dispose();
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الكود الشخصى", textAlign: TextAlign.center),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                width: 300,
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Image.asset('assets/images/user-bar-code.png',
                    fit: BoxFit.fill),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
              CustomTextLine(text: "زمن تغير ال Qr code"),
              LinearProgressIndicator(
                color: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey[300],
                value: 0.25,
                // valueColor: controller,
                semanticsLabel: 'Linear progress indicator',
              ),
              const Text(
                '25 ثانية',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
