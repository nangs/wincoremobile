// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print, non_constant_identifier_names, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/accountInformation/accInformation_response.dart';

class AccountBalance extends StatefulWidget {
  AccountBalance({Key? key, required this.response}) : super(key: key);

  AccountInfoResponse response;
  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  final moneyFormat = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    var responseInfo = widget.response.info;
    var nama = responseInfo?.accountName.toString();
    var noRek = responseInfo?.accountNo.toString();
    var saldo = responseInfo?.saldoEfektif.toString();
    // var dob = responseInfo?.tanggalLahir.toString();
    var alamat = responseInfo?.alamat.toString();

    // var dobYear = dob.toString().substring(0, 4);
    // var dobMonth = dob.toString().substring(4, 6);
    // var dobDay = dob.toString().substring(6, 8);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Rekening"),
        backgroundColor: const Color(0xff120A7C),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nama.toString(),
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff120A7C),
                              ),
                            ),
                            Text(
                              noRek.toString(),
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xff120A7C),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          child: Image.asset(
                            'assets/images/icons-new/menuicon_info_rekening.png',
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff120A7C),
                    boxShadow: [
                      const BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Saldo anda :",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            Text(
                              "Rp " +
                                  moneyFormat
                                      .format(double.parse(saldo.toString())),
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff120A7C),
                    boxShadow: [
                      const BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tanggal Inquiry :",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("yyyy/MM/dd - HH:mm:ss")
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Alamat : ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    alamat.toString().isEmpty
                                        ? "-"
                                        : alamat.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
