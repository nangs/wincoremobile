// ignore_for_file: prefer_const_constructors, unnecessary_new, must_be_immutable

import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/pulsa/pulsa_request.dart';

class Xl extends StatefulWidget {
  const Xl({Key? key}) : super(key: key);

  @override
  State<Xl> createState() => _XlStateState();
}

class _XlStateState extends State<Xl> {
  final myPhone1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text('Xl'),
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
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.fromLTRB(32, 10, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 1.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 1.675'),
                                onPressed: () async {
                                  var rup = '1.675';
                                  var pul = '1.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 2.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 2.750'),
                                onPressed: () async {
                                  var rup = '2.750';
                                  var pul = '2.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 3.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 3.850'),
                                onPressed: () async {
                                  var rup = '3.850';
                                  var pul = '3.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 4.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 4.850'),
                                onPressed: () async {
                                  var rup = '4.850';
                                  var pul = '4.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 5.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 5.450'),
                                onPressed: () async {
                                  var rup = '5.450';
                                  var pul = '5.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 10.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 10.450'),
                                onPressed: () async {
                                  var rup = '10.450';
                                  var pul = '10.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 15.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 15.450'),
                                onPressed: () async {
                                  var rup = '15.450';
                                  var pul = '15.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 20.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 20.450'),
                                onPressed: () async {
                                  var rup = '20.450';
                                  var pul = '20.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 25.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 25.350'),
                                onPressed: () async {
                                  var rup = '25.350';
                                  var pul = '25.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
                              ),
                            ],
                          ),
                        ),
                        _buildDivider(),
                        ListTile(
                          title: const Text("Pulsa Reguler Xl 30.000"),
                          trailing: Column(
                            children: <Widget>[
                              //Text('Test'),
                              ElevatedButton(
                                child: Text('Rp. 30.250'),
                                onPressed: () async {
                                  var rup = '30.250';
                                  var pul = '30.000';
                                  var ket1 = 'XL';
                                  var ket2 = 'Xl';
                                  await openDialog(rup, pul, ket1, ket2);
                                },
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

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade400,
    );
  }

  Future<String?> openDialog(rup, pul, ket1, ket2) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Masukkan No HP'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'No HP'),
            controller: myPhone1Controller,
          ),
          actions: [
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        phone: myPhone1Controller.text,
                        rupiah: rup,
                        pul: pul,
                        ket1: ket1,
                        ket2: ket2,
                      ),
                    ));
              },
              //onPressed: submit,
            ),
          ],
        ),
      );
}
