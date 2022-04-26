// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:wincoremobile/component/no_internet_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MaterialApp(
      title: 'Wincore Mobiles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: const NoInternetWidget(),
    );
  }
}
