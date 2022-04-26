// ignore_for_file: file_names

import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
// import 'dart:async';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key, this.error}) : super(key: key);

  static String tag = '/ErrorScreen';
  final String? error;

  @override
  ErrorScreenState createState() => ErrorScreenState();
}

class ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/computer.png',
                height: 250, width: context.width()),
            16.height,
            Text(widget.error.validate(),
                    style: boldTextStyle(size: 20), textAlign: TextAlign.center)
                .center()
                .paddingOnly(left: 16, right: 16),
          ],
        ),
      ),
    );
  }
}
