// import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:wincoremobile/model/auth/auth_cubit.dart';
// import 'package:wincoremobile/screen/auth/welcome.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xff120A7C),
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/wbk-large.jpeg',
                  width: double.infinity,
                ),
              ],
            )),
      ),
    );
  }
}
