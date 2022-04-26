// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_new, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDepositoDetail_response.dart';

class AccountDepositoDetail extends StatefulWidget {
  AccountDepositoDetail({
    Key? key,
    required this.response,
    required this.userid,
    required this.no_rek,
    required this.username,
    required this.CIF,
    required this.mpin,
    required this.produk,
  }) : super(key: key);
  DepositoDetailResponse response;
  String userid;
  String no_rek;
  String username;
  String CIF;
  String mpin;
  String produk;
  @override
  State<AccountDepositoDetail> createState() => _AccountDepositoDetailState();
}

class _AccountDepositoDetailState extends State<AccountDepositoDetail> {
  final moneyFormat = new NumberFormat("#,##0.00", "en_US");
  @override
  Widget build(BuildContext context) {
    var response = widget.response;
    var responseInfo = response.info!;
    var tanggalMulai = responseInfo.tanggalMulai.toString();
    var tanggalAkhir = responseInfo.tanggalMulai.toString();
    var jangkaWaktu = responseInfo.jangkaWaktu.toString();

    var tglMulaiYear = tanggalMulai.toString().substring(0, 4);
    var tglMulaiMonth = tanggalMulai.toString().substring(4, 6);
    var tglMulaiDay = tanggalMulai.toString().substring(6, 8);

    var tglAkhirYear = tanggalAkhir.toString().substring(0, 4);
    var tglAkhirMonth = tanggalAkhir.toString().substring(4, 6);
    var tglAkhirDay = tanggalAkhir.toString().substring(6, 8);

    tanggalMulai = tglMulaiDay + "/" + tglMulaiMonth + "/" + tglMulaiYear;
    tanggalAkhir = tglAkhirDay + "/" + tglAkhirMonth + "/" + tglAkhirYear;
    jangkaWaktu = int.parse(jangkaWaktu.substring(0, 4).toString()).toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Deposito"),
        // centerTitle: true,
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hi, " + responseInfo.nama.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Text(
                          responseInfo.noRef.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          widget.produk,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    // margin: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                      boxShadow: [
                        const BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Jumlah Dana Deposito",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.nominalDeposito
                                              .toString())),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Jangka Waktu",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  jangkaWaktu.toString() + " Bulan",
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tanggal Penempatan",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  tanggalMulai.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tanggal Jatuh Tempo",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  tanggalAkhir.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Suku Bunga",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  responseInfo.sukuBunga.toString() + " % p.a",
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Bunga Berjalan",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.akrualBunga.toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
