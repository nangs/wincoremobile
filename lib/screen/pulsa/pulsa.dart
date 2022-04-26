// ignore_for_file: prefer_const_constructors, unnecessary_new, must_be_immutable

import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/pulsa/smart.dart';
import 'package:wincoremobile/screen/pulsa/telkomsel.dart';
import 'package:wincoremobile/screen/pulsa/indosat.dart';
import 'package:wincoremobile/screen/pulsa/tri.dart';
import 'package:wincoremobile/screen/pulsa/xl.dart';
import 'package:wincoremobile/screen/pulsa/axis.dart';

class Pulsa extends StatefulWidget {
  const Pulsa({Key? key}) : super(key: key);

  @override
  State<Pulsa> createState() => _PulsaStateState();
}

class _PulsaStateState extends State<Pulsa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text('Pulsa'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              color: const Color(0xFFF5F3F3),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Card(
                                    elevation: 0.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Telkom()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/telkomsel.png',
                                            width: 90,
                                            height: 50,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "TELKOMSEL",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Card(
                                    elevation: 0.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Indosat()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/indosat.png',
                                            width: 90,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "INDOSAT",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Card(
                                    elevation: 0.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Xl()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/xl.png',
                                            width: 90,
                                            height: 50,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "XL",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Card(
                                    elevation: 0.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Axxis()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/axis.png',
                                            width: 90,
                                            height: 50,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "AXIS",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Card(
                                    elevation: 0.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Smart()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/smart.png',
                                            width: 90,
                                            height: 50,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "SMART",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Card(
                                    elevation: 0.2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Tri()));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/tri.png',
                                            width: 90,
                                            height: 50,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "TRI",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Container _buildDivider() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(
  //       horizontal: 8,
  //     ),
  //     width: double.infinity,
  //     height: 1,
  //     color: Colors.grey.shade400,
  //   );
  // }
}
