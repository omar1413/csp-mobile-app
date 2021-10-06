import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/login_screen.dart';

import '../../constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/onboard_model.dart';

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/slide-1.png',
      text: "خطوة 1",
      desc:
          "مرشد التطبيق يظهر فيها اول مره يتم فتح فيها التطبيق و يظهر بعد الصفحه الافتتاحيه وهو عباره عن صفحه او مجموعه صفحات يستعرض فبها خدمات و محتوى التطبيق بشكل عام ويتم فيها توضيح اى تعليمات هامه لمستخدمى النظام ",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/slide-2.png',
      text: "خطوة 2",
      desc:
          "مرشد التطبيق يظهر فيها اول مره يتم فتح فيها التطبيق و يظهر بعد الصفحه الافتتاحيه وهو عباره عن صفحه او مجموعه صفحات يستعرض فبها خدمات و محتوى التطبيق بشكل عام ويتم فيها توضيح اى تعليمات هامه لمستخدمى النظام ",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/images/slide-3.png',
      text: "خطوة 3",
      desc:
          "مرشد التطبيق يظهر فيها اول مره يتم فتح فيها التطبيق و يظهر بعد الصفحه الافتتاحيه وهو عباره عن صفحه او مجموعه صفحات يستعرض فبها خدمات و محتوى التطبيق بشكل عام ويتم فيها توضيح اى تعليمات هامه لمستخدمى النظام ",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    // print("Shared pref called");
    // int isViewed = 0;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('onBoard', isViewed);
    // print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(children: [
        Image.asset(
          "assets/images/demo-bg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              TextButton(
                onPressed: () {
                  _storeOnboardInfo();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "تخطى",
                  style: TextStyle(
                    color: kwhite,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PageView.builder(
                itemCount: screens.length,
                controller: _pageController,
                // physics: NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(screens[index].img),
                      Container(
                        height: 10.0,
                        child: ListView.builder(
                          itemCount: screens.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 3.0),
                                    width: currentIndex == index ? 25 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? kbrown
                                          : kbrown300,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ]);
                          },
                        ),
                      ),
                      Text(
                        screens[index].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: kwhite,
                        ),
                      ),
                      Text(
                        screens[index].desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Montserrat',
                          color: kwhite,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          print(index);
                          if (index == screens.length - 1) {
                            await _storeOnboardInfo();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homeScreen()));
                          }

                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceIn,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          decoration: BoxDecoration(
                              color: index % 2 == 0 ? kblue : kwhite,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              "التالى",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: index % 2 == 0 ? kwhite : kblue),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: index % 2 == 0 ? kwhite : kblue,
                            ),
                          ]),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
