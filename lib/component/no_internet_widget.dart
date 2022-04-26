// import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wincoremobile/component/NoInternetConnection.dart';
import 'package:wincoremobile/component/url_provider_widget.dart';
import 'package:wincoremobile/component/no_internet.dart';

class NoInternetWidget extends StatefulWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  _NoInternetWidgetState createState() => _NoInternetWidgetState();
}

class _NoInternetWidgetState extends State<NoInternetWidget> {
  String _connectionStatus = 'ConnectivityResult.none';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    NoInternet.initConnectivity().then((value) => setState(() {
          _connectionStatus = value;
        }));

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      NoInternet.updateConnectionStatus(result).then((value) => setState(() {
            _connectionStatus = value;
            if (result == ConnectivityResult.none) {
              log('not connected');
              push(const NoInternetConnection());
            } else {
              pop();
              log('connected');
            }
          }));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wincore Mobiles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      home: _connectionStatus == 'ConnectivityResult.none'
          ? const NoInternetConnection()
          : const UrlProviderWidget(),
    );
  }
}
