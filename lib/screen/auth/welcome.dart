// import 'dart:async';
// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoremobile/screen/auth/register/register.dart';
import 'package:wincoremobile/screen/auth/sign_in/sign_in.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // @override
  // void initState() {
  //   super.initState();
  //   initConnectivity();

  //   _connectivitySubscription =
  //       _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  // }

  // @override
  // void dispose() {
  //   _connectivitySubscription.cancel();
  //   super.dispose();
  // }

  // // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initConnectivity() async {
  //   late ConnectivityResult result;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     print('Couldn\'t check connectivity status' + e.message.toString());
  //     return;
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) {
  //     return Future.value(null);
  //   }

  //   return _updateConnectionStatus(result);
  // }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //   setState(() {
  //     _connectionStatus = result;
  //   });
  // }

  // bool? _isConnectionSuccessful;

  // Future<void> _tryConnection() async {
  //   try {
  //     final response = await InternetAddress.lookup('www.woolha2.com');

  //     setState(() {
  //       _isConnectionSuccessful = response.isNotEmpty;
  //     });
  //   } on SocketException catch (e) {
  //     setState(() {
  //       _isConnectionSuccessful = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background2.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight),
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        width: double.infinity,
                      ),
                      Image.asset(
                        'assets/images/WINCore copy1.png',
                        width: 245,
                        alignment: Alignment.topCenter,
                        //width: double.infinity,
                      ),
                      const SizedBox(
                        height: 209,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Selamat Datang,",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: const Text(
                          "Mulai hari mu dengan WINCore Mobile !",
                          style: TextStyle(
                            fontSize: 13,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "Montserrat",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                "Buat Akun Baru",
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Register(),
                              ));
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade900),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "atau",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                "Masuk",
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade900),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
