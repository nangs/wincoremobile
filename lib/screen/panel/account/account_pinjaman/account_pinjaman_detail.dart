// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_new, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjamanDetail_response.dart';

class AccountPinjamanDetail extends StatefulWidget {
  AccountPinjamanDetail({
    Key? key,
    required this.response,
    required this.userid,
    required this.no_rek,
    required this.username,
    required this.CIF,
    required this.mpin,
    required this.produk,
  }) : super(key: key);
  PinjamanDetailResponse response;
  String userid;
  String no_rek;
  String username;
  String CIF;
  String mpin;
  String produk;
  @override
  State<AccountPinjamanDetail> createState() => _AccountPinjamanDetailState();
}

class _AccountPinjamanDetailState extends State<AccountPinjamanDetail> {
  final moneyFormat = new NumberFormat("#,##0.00", "en_US");
  @override
  Widget build(BuildContext context) {
    var response = widget.response;
    var responseInfo = response.info!;
    var tanggalMulai = responseInfo.tanggal_Mulai.toString();
    var tanggalAkhir = responseInfo.tanggal_Akhir.toString();
    var tanggalAngsuranPokok = responseInfo.tanggal_Angsuran_Pokok.toString();
    var tanggalAngsuranBunga = responseInfo.tanggal_Angsuran_Bunga.toString();

    var tglMulaiYear = tanggalMulai.toString().substring(0, 4);
    var tglMulaiMonth = tanggalMulai.toString().substring(4, 6);
    var tglMulaiDay = tanggalMulai.toString().substring(6, 8);

    var tglAkhirYear = tanggalAkhir.toString().substring(0, 4);
    var tglAkhirMonth = tanggalAkhir.toString().substring(4, 6);
    var tglAkhirDay = tanggalAkhir.toString().substring(6, 8);

    var tglAngsuranPokokYear = tanggalAngsuranPokok.toString().substring(0, 4);
    var tglAngsuranPokokMonth = tanggalAngsuranPokok.toString().substring(4, 6);
    var tglAngsuranPokokDay = tanggalAngsuranPokok.toString().substring(6, 8);

    var tglAngsuranBungaYear = tanggalAngsuranBunga.toString().substring(0, 4);
    var tglAngsuranBungaMonth = tanggalAngsuranBunga.toString().substring(4, 6);
    var tglAngsuranBungaDay = tanggalAngsuranBunga.toString().substring(6, 8);

    tanggalMulai = tglMulaiDay + "/" + tglMulaiMonth + "/" + tglMulaiYear;
    tanggalAkhir = tglAkhirDay + "/" + tglAkhirMonth + "/" + tglAkhirYear;
    tanggalAngsuranPokok = tglAngsuranPokokDay +
        "/" +
        tglAngsuranPokokMonth +
        "/" +
        tglAngsuranPokokYear;

    tanggalAngsuranBunga = tglAngsuranBungaDay +
        "/" +
        tglAngsuranBungaMonth +
        "/" +
        tglAngsuranBungaYear;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informasi Pinjaman",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        // centerTitle: true,
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xff120A7C),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                        ),
                        Text(
                          //widget.produk,
                          responseInfo.produk_Pinjaman.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                      boxShadow: [
                        const BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Jumlah Baki Debet",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.baki_Debet.toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total Angsuran",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.total_Angsuran
                                              .toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tanggal Mulai",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  tanggalMulai.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tanggal Akhir",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  tanggalAkhir.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Suku Bunga",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  responseInfo.suku_Bunga.toString() + " % p.a",
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tanggal Angsuran Pokok",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  tanggalAngsuranPokok.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tanggal Angsuran Bunga",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  tanggalAngsuranBunga.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tagihan Pokok",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.tagihan_Pokok
                                              .toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tagihan Bunga",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.tagihan_Bunga
                                              .toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tunggakan Pokok",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.tunggakan_Pokok
                                              .toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tunggakan Bunga",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.tunggakan_Bunga
                                              .toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Denda Pokok",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.denda_Pokok.toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Denda Bunga",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.denda_Bunga.toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Denda Keterlambatan",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  "Rp " +
                                      moneyFormat.format(double.parse(
                                          responseInfo.denda_Keterlambatan
                                              .toString())),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // const Divider(color: Colors.black),
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
