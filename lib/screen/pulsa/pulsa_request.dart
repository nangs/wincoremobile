// ignore_for_file: unnecessary_brace_in_string_interps, duplicate_ignore, unnecessary_new

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/screen/pulsa/pulsa.dart';

class SecondScreen extends StatelessWidget {
  final String phone;
  final String rupiah;
  final String ket1;
  final String ket2;
  final String pul;

  // receive data from the FirstScreen as a parameter
  const SecondScreen(
      {Key? key,
      required this.phone,
      required this.rupiah,
      required this.ket1,
      required this.ket2,
      required this.pul})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text('Laporan Pembelian Pulsa'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
                height: 50.0,
                padding: const EdgeInsets.all(12.0),

                // ignore: unnecessary_string_interpolations
                child: Text('${ket1}',
                    style: const TextStyle(
                      fontSize: 24,
                    ))),
            const Text('Rincian Transaksi Pembelian Pulsa',
                style: TextStyle(
                  fontSize: 15,
                )),
            // ignore: avoid_unnecessary_containers
            Container(
              //height: 10,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    //elevation: 1,
                    margin: const EdgeInsets.fromLTRB(32, 45, 32, 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        // ignore: unnecessary_brace_in_string_interps
                        const Text('Header}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                        Align(
                          alignment: Alignment.topLeft,
                          child:
                              // ignore: unnecessary_brace_in_string_interps
                              Text('    No HP : ${phone}',
                                  style: const TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                  )),
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child:
                              // ignore: unnecessary_brace_in_string_interps
                              Text('    Pulsa : ${pul}',
                                  style: const TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                  )),
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child:
                              // ignore: unnecessary_brace_in_string_interps
                              Text('    Harga : Rp.${rupiah}',
                                  style: const TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                  )),
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child:
                              // ignore: unnecessary_brace_in_string_interps
                              Text('    Tanggal : ${formattedDate}',
                                  style: const TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                  )),
                        ),

                        const Align(
                          alignment: Alignment.topLeft,
                          child:
                              // ignore: unnecessary_brace_in_string_interps
                              Text('    ID Transaksi : 6868686868',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                  )),
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child:
                              // ignore: unnecessary_brace_in_string_interps
                              Text('    Produk : ${ket2}',
                                  style: const TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                  )),
                        ),

                        const Align(
                          alignment: Alignment.topLeft,
                          child:
                              // ignore: unnecessary_brace_in_string_interps
                              Text('    Status : Sukses',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                  )),
                        ),

                        // ignore: unnecessary_brace_in_string_interps
                        const Text('Footer}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),

                        //const ListTile(title: Text("Status : Sukses")),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Kembali ke Menu Pulsa'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pulsa(),
                          ));
                    },
                    //onPressed: submit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
