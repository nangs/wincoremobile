// import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/animate/splashscreen.dart';
import 'package:wincoremobile/component/splashscreen2.dart';
import 'package:wincoremobile/component/errorScreen.dart';
import 'package:wincoremobile/api/globals.dart' as globals;
import 'package:wincoremobile/api/api_config.dart';
import 'dart:async';
import 'dart:io';
// import 'dart:convert' as convert;

class UrlProviderWidget extends StatefulWidget {
  const UrlProviderWidget({Key? key}) : super(key: key);

  @override
  _UrlProviderWidgetState createState() => _UrlProviderWidgetState();
}

class _UrlProviderWidgetState extends State<UrlProviderWidget> {
  String _statusConn = "NotOK";

  @override
  void initState() {
    super.initState();

    checkConnection1();
  }

  Future<void> checkConnection1() async {
    var host = getHostname(ApiConfig.apiurl1);
    var hostPort = getHostport(ApiConfig.apiurl1);
    Socket.connect(host, hostPort, timeout: const Duration(seconds: 5))
        .then((socket) {
      print("Success");
      setState(() {
        _statusConn = "OK";
        globals.switchAPIurl = false;
      });

      socket.destroy();
    }).catchError((error) {
      print("Exception on Socket " + error.toString());
      setState(() {
        _statusConn = "NotOK";
      });

      checkConnection2();
    });
  }

  Future<void> checkConnection2() async {
    var host = getHostname(ApiConfig.apiurl2);
    var hostPort = getHostport(ApiConfig.apiurl2);
    Socket.connect(host, hostPort, timeout: const Duration(seconds: 5))
        .then((socket) {
      print("Success");
      setState(() {
        _statusConn = "OK";
        globals.switchAPIurl = true;
      });

      socket.destroy();
    }).catchError((error) {
      print("Exception on Socket " + error.toString());
      setState(() {
        _statusConn = "NotOK";
        globals.isError = true;
      });
    });
  }

  String getHostname(String url) {
    var hostname = '';

    if (url.contains('//')) {
      hostname = url.split('/')[2];
    } else {
      hostname = url.split('/')[0];
    }

    hostname = hostname.split(':')[0];
    hostname = hostname.split('?')[0];

    return hostname;
  }

  int getHostport(String url) {
    var hostname = '';
    var port = 0;

    if (url.contains('//')) {
      hostname = url.split('/')[2];
    } else {
      hostname = url.split('/')[0];
    }

    hostname = hostname.split(':')[1];
    hostname = hostname.split('?')[0];
    port = int.parse(hostname);
    return port;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wincore Mobiles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: globals.isError == true
          ? const ErrorScreen()
          : _statusConn == "NotOK"
              ? const SplashScreen2()
              : const SplashScreen(),
    );
  }
}
