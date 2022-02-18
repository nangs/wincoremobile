// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_response.dart';

class AccountActivitiesDetails extends StatefulWidget {
  AccountActivitiesDetails({
    Key? key,
    required this.response,
    required this.username,
    required this.userid,
    required this.mpin,
    required this.startDate,
    required this.endDate,
    required this.noRek,
  }) : super(key: key);

  AccountActivitiesResponse response;
  String noRek;
  String username;
  String startDate;
  String endDate;
  String userid;
  String mpin;

  @override
  State<AccountActivitiesDetails> createState() =>
      _AccountActivitiesDetailsState();
}

class _AccountActivitiesDetailsState extends State<AccountActivitiesDetails> {
  @override
  Widget build(BuildContext context) {
    var responseInfo = widget.response.info;

    var mutasiList = responseInfo?.mutasi;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mutasi Saldo"),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF5F3F3),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                  ),
                  // height: 90,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "No Rekening : " + widget.noRek,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text("Periode : ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(widget.startDate,
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(" - ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(widget.endDate,
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Tanggal Inquiry : " +
                                    DateFormat("yyyy/MM/dd")
                                        .format(DateTime.now()),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          for (int x = 0; x < mutasiList!.length; x++)
                            accActivityDetails(
                              user_input: mutasiList[x].userInput.toString(),
                              jam_input: mutasiList[x].jamInput.toString(),
                              keterangan_1:
                                  mutasiList[x].keterangan1.toString(),
                              keterangan_2:
                                  mutasiList[x].keterangan2.toString(),
                              mata_uang: mutasiList[x].mataUang.toString(),
                              nilai_transaksi:
                                  mutasiList[x].nilaiTransaksi.toString(),
                              no_referensi:
                                  mutasiList[x].noReferensi.toString(),
                              sign_transaksi:
                                  mutasiList[x].signTransaksi.toString(),
                              tanggal_posting:
                                  mutasiList[x].tanggalPosting.toString(),
                              tanggal_valuta:
                                  mutasiList[x].tanggalValuta.toString(),
                            )

                          // accActivityDetails(
                          //   user_input: 'Nana',
                          //   jam_input: '111111',
                          //   keterangan_1: 'Test Kirim',
                          //   keterangan_2: '',
                          //   mata_uang: 'IDR',
                          //   nilai_transaksi: '25000000',
                          //   no_referensi: 'AB0321654684321',
                          //   sign_transaksi: 'D',
                          //   tanggal_posting: '20220202',
                          //   tanggal_valuta: '20220202',
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Sebelumnya")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Selanjutnya")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class accActivityDetails extends StatefulWidget {
  accActivityDetails(
      {Key? key,
      required this.keterangan_1,
      required this.keterangan_2,
      required this.nilai_transaksi,
      required this.user_input,
      required this.jam_input,
      required this.tanggal_valuta,
      required this.no_referensi,
      required this.mata_uang,
      required this.sign_transaksi,
      required this.tanggal_posting})
      : super(key: key);
  String keterangan_1;
  String keterangan_2;
  String nilai_transaksi;
  String user_input;
  String jam_input;
  String tanggal_valuta;
  String no_referensi;
  String mata_uang;
  String sign_transaksi;
  String tanggal_posting;

  @override
  State<accActivityDetails> createState() => _accActivityDetailsState();
}

class _accActivityDetailsState extends State<accActivityDetails> {
  final moneyFormat = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    var Jam = widget.jam_input.toString().substring(0, 2);
    var Menit = widget.jam_input.toString().substring(2, 4);
    var Detik = widget.jam_input.toString().substring(4, 6);

    var tglPostingYear = widget.tanggal_posting.toString().substring(0, 4);
    var tglPostingMonth = widget.tanggal_posting.toString().substring(4, 6);
    var tglPostingDay = widget.tanggal_posting.toString().substring(6, 8);

    var tglValutaYear = widget.tanggal_valuta.toString().substring(0, 4);
    var tglValutaMonth = widget.tanggal_valuta.toString().substring(4, 6);
    var tglValutaDay = widget.tanggal_valuta.toString().substring(6, 8);

    var jamPosting = Jam + ":" + Menit + ":" + Detik;
    var tglPosting =
        tglPostingYear + "/" + tglPostingMonth + "/" + tglPostingDay;
    var tglValuta = tglValutaYear + "/" + tglValutaMonth + "/" + tglValutaDay;

    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            tglPosting + " - " + jamPosting,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.user_input + " " + widget.keterangan_2,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    widget.keterangan_1 + " " + widget.keterangan_2,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Ref No : " + widget.no_referensi,
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.mata_uang +
                        " " +
                        moneyFormat.format(
                            double.parse(widget.nilai_transaksi.toString())),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.sign_transaksi,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.all(8),
          // padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        )
      ],
    );
  }
}
