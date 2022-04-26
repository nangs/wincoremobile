// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  static String tag = '/NoInternetConnection';

  @override
  NoInternetConnectionState createState() => NoInternetConnectionState();
}

class NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/no_wifi.png',
                height: 150, width: 150, fit: BoxFit.cover, color: Colors.blue),
            30.height,
            Text('Tidak ada jaringan', style: boldTextStyle(size: 24)),
            8.height,
            Text('Silakan periksa koneksi internet Anda dan coba lagi',
                    style: secondaryTextStyle(size: 16),
                    textAlign: TextAlign.center)
                .paddingOnly(left: 16, right: 16),
          ],
        ),
      ),
    );
  }
}
