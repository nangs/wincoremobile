// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, avoid_print, unnecessary_new

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/portfolio/portfolio_response.dart';

class Portfolio extends StatefulWidget {
  Portfolio({
    Key? key,
    required this.CIF,
    required this.username,
    required this.userid,
    required this.mpin,
    required this.response,
  }) : super(key: key);

  String CIF;
  String username;
  String userid;
  String mpin;
  PortfolioResponse response;

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    var responseInfo = widget.response.info;
    var responseStatus = widget.response.status;
    var infoAccounts = responseInfo?.accounts;

    print(responseStatus);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Portofolio",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff120A7C),
        centerTitle: true,
        // elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xff120A7C),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "No CIF",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.CIF,
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nama Nasabah",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (int x = 0; x < infoAccounts!.length; x++)
                    PortfolioItem(
                      ItemIndex: x.toString(),
                      accountName: infoAccounts[x].accountName.toString(),
                      accountNo: infoAccounts[x].accountNo.toString(),
                      jam: infoAccounts[x].jam.toString(),
                      jenisRekening: infoAccounts[x].jenisRekening.toString(),
                      mataUang: infoAccounts[x].mataUang.toString(),
                      produkRekening: infoAccounts[x].produkRekening.toString(),
                      saldoBuku: infoAccounts[x].saldoBuku.toString(),
                      saldoEfektif: infoAccounts[x].saldoEfektif.toString(),
                      status: infoAccounts[x].status.toString(),
                      tanggal: infoAccounts[x].tanggal.toString(),
                      tipeRekening: infoAccounts[x].tipeRekening.toString(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioItem extends StatefulWidget {
  PortfolioItem({
    Key? key,
    required this.ItemIndex,
    required this.accountName,
    required this.accountNo,
    required this.jam,
    required this.jenisRekening,
    required this.mataUang,
    required this.produkRekening,
    required this.saldoBuku,
    required this.saldoEfektif,
    required this.status,
    required this.tanggal,
    required this.tipeRekening,
  }) : super(key: key);

  String ItemIndex;
  String accountName;
  String accountNo;
  String jam;
  String jenisRekening;
  String mataUang;
  String produkRekening;
  String saldoBuku;
  String saldoEfektif;
  String status;
  String tanggal;
  String tipeRekening;

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  final moneyFormat = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    var Jam = widget.jam.toString().substring(0, 2);
    var Menit = widget.jam.toString().substring(2, 4);
    var Detik = widget.jam.toString().substring(4, 6);

    var jamFormatted = Jam + ":" + Menit + ":" + Detik;

    print("Index No : " + widget.ItemIndex.toString());
    print("accountName : " + widget.accountName.toString());
    print("accountNo : " + widget.accountNo.toString());
    print(jamFormatted);
    print("jenisrekening : " + widget.jenisRekening.toString());
    print("mataUang : " + widget.mataUang.toString());
    print("produkRekening : " + widget.produkRekening.toString());
    print("saldoBuku : " + widget.saldoBuku.toString());
    print("saldoEfektif : " + widget.saldoEfektif.toString());
    print("status : " + widget.status.toString());
    print("tanggal : " + widget.tanggal.toString());
    print("tipeRekening : " + widget.tipeRekening.toString());
    print("==============================");
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 50,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              // color: Colors.blue,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey.shade300),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.jenisRekening,
                  style: const TextStyle(
                    color: Color(0xff120A7C),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.jenisRekening == "TABUNGAN"
                      ? const AssetImage(
                          "assets/images/icons-new/portfolio_tabungan.png")
                      : (widget.jenisRekening == "DEPOSITO"
                          ? const AssetImage(
                              "assets/images/icons-new/portfolio_deposito.png")
                          : const AssetImage(
                              "assets/images/icons-new/portfolio_pinjaman.png")),
                  scale: 4,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("No Rekening",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xff120A7C),
                              fontSize: 11.5,
                            )),
                        Text(
                          widget.accountNo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: Color(0xff120A7C),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Produk",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xff120A7C),
                              fontSize: 11.5,
                            )),
                        Text(
                          widget.produkRekening,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: Color(0xff120A7C),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Mata Uang",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xff120A7C),
                              fontSize: 11.5,
                            )),
                        Text(
                          widget.mataUang,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: Color(0xff120A7C),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Saldo Efektif",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                              color: Color(0xff120A7C),
                              fontSize: 11.5,
                            )),
                        Text(
                          moneyFormat.format(
                              double.parse(widget.saldoEfektif.toString())),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: Color(0xff120A7C),
                            fontSize: 11.5,
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
    );
  }
}
