// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_response.dart';
import 'package:wincoremobile/helper/modal.dart';

class TransferBalanceConfirmation extends StatefulWidget {
  TransferBalanceConfirmation({
    Key? key,
    required this.response,
    required this.noRek,
    required this.username,
    required this.userid,
    required this.jmlTransfer,
    required this.keterangan,
    required this.cust_no,
    required this.lastLogin,
    required this.isFromDstAccountList,
  }) : super(key: key);

  String noRek;
  String username;
  String userid;
  String jmlTransfer;
  String keterangan;
  String cust_no;
  String lastLogin;
  TransferConfirmationPBResponse response;
  bool isFromDstAccountList;

  @override
  _TransferBalanceConfirmationState createState() =>
      _TransferBalanceConfirmationState();
}

class _TransferBalanceConfirmationState
    extends State<TransferBalanceConfirmation> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    const _locale = 'en';
    String _formatNumber(String s) =>
        NumberFormat.decimalPattern(_locale).format(int.parse(s));
    widget.jmlTransfer = _formatNumber(widget.jmlTransfer.replaceAll(',', ''));

    String? noRekTujuan = widget.response.info?.accountNo;
    String? namaRekTujuan = widget.response.info?.accountName;

    //var jumlahTransfer = widget.jmlTransfer.replaceAll(",", "");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transfer Saldo (PB)",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
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
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 11, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "Konfirmasi Transfer Saldo",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Divider(color: Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Sumber Dana",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff120A7C),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nama",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                widget.username,
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  // fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nomor Rekening",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                widget.noRek,
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  // fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Rekening Tujuan",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff120A7C),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nama",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                namaRekTujuan.toString(),
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  // fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nomor Rekening",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                noRekTujuan.toString(),
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  // fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nominal",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                "Rp " + widget.jmlTransfer,
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Keterangan",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                widget.keterangan.isEmpty
                                    ? "-"
                                    : widget.keterangan,
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  widget.isFromDstAccountList == false
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              checkColor: Colors.black,
                              activeColor: Colors.white,
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            const Text(
                              "Simpan Rekening Tujuan ke Daftar Rekening",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4.3,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 2.5,
                    child: ElevatedButton(
                      onPressed: () {
                        M_PIN_PindahBukuModalDialog(
                          context,
                          widget.username,
                          widget.userid,
                          widget.noRek,
                          noRekTujuan.toString(),
                          namaRekTujuan.toString(),
                          int.parse(widget.jmlTransfer.replaceAll(",", "")),
                          widget.keterangan,
                          widget.cust_no,
                          widget.lastLogin,
                          isChecked,
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff120A7C)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          "Transfer Saldo",
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
            ),
          ),
        ),
      ),
    );
  }
}
