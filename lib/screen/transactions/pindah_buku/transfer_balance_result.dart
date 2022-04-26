// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/pindahbuku_response.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

class TransferBalanceResult extends StatefulWidget {
  TransferBalanceResult({
    Key? key,
    required this.response,
    required this.username,
    required this.userid,
    required this.accountNo,
    required this.usernameDst,
    required this.accountNoDst,
    required this.amount,
    required this.cust_no,
    required this.lastLogin,
  }) : super(key: key);

  PindahBukuResponse response;
  String username;
  String userid;
  String accountNo;
  String usernameDst;
  String accountNoDst;
  String amount;
  String cust_no;
  String lastLogin;
  @override
  _TransferBalanceResultState createState() => _TransferBalanceResultState();
}

class _TransferBalanceResultState extends State<TransferBalanceResult> {
  @override
  Widget build(BuildContext context) {
    var isSuccess = widget.response.status == "SUCCESS" ? true : false;

    const _locale = 'en';
    String _formatNumber(String s) =>
        NumberFormat.decimalPattern(_locale).format(int.parse(s));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Saldo (PB)"),
        backgroundColor: const Color(0xff120A7C),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        child: isSuccess == true
                            ? const Image(
                                image: AssetImage(
                                    "assets/images/icons-new/yes_transparent.png"))
                            : const Image(
                                image: AssetImage(
                                    "assets/images/icons-new/no_transparent.png")),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      isSuccess == true
                          ? const Text(
                              "Transaksi anda berhasil",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Transaksi anda gagal",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                      Text(
                        "Rp " +
                            _formatNumber(widget.amount.replaceAll(',', '')),
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Nomor Referensi",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  widget.response.refNo.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Nomor Rekening Pengirim",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  widget.accountNo.toString(),
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Nama Pengirim",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  widget.username,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Nomor Rekening Penerima",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  widget.accountNoDst,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Color(0xff120A7C),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Nama Penerima",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  widget.usernameDst,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff120A7C),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Waktu Transaksi",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                ),
                                Text(
                                  DateFormat("yyyy/MM/dd HH:mm:ss")
                                      .format(DateTime.now()),
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Color(0xff120A7C),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4.5,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isSuccess == true
                              ? const Text(
                                  "Silahkan melakukan konfirmasi transaksi ini dengan penerima saldo",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : const Text(
                                  "Transaksi anda tidak dapat kami teruskan",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff120A7C),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Home(
                                  no_rek: widget.accountNo,
                                  userid: widget.userid,
                                  username: widget.username,
                                  cust_no: widget.cust_no,
                                  lastLogin: widget.lastLogin,
                                ),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff120A7C)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(14),
                            child: Text(
                              "Selesai",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
