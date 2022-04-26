// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_response.dart';
import 'package:wincoremobile/helper/modal.dart';

class QrisTransferBalance extends StatefulWidget {
  QrisTransferBalance({
    Key? key,
    required this.response,
    required this.noRek,
    required this.username,
    required this.userid,
    required this.cust_no,
    required this.lastLogin,
  }) : super(key: key);

  String noRek;
  String username;
  String userid;
  String cust_no;
  String lastLogin;
  TransferConfirmationPBResponse response;
  @override
  State<QrisTransferBalance> createState() => _QrisTransferBalanceState();
}

class _QrisTransferBalanceState extends State<QrisTransferBalance> {
  final _transferAmountController = TextEditingController();
  final _keteranganController = TextEditingController();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    const _locale = 'en';
    String _formatNumber(String s) =>
        NumberFormat.decimalPattern(_locale).format(int.parse(s));
    // widget.jmlTransfer = _formatNumber(widget.jmlTransfer.replaceAll(',', ''));

    String? noRekTujuan = widget.response.info?.accountNo;
    String? namaRekTujuan = widget.response.info?.accountName;

    // var jumlahTransfer = widget.jmlTransfer.replaceAll(",", "");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transfer Saldo (PB)",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
            child: Column(
              children: [
                Column(
                  children: const [
                    Text(
                      "Konfirmasi Transfer Saldo",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.black),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Sumber Dana",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nama"),
                        Text(
                          widget.username,
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nomor Rekening"),
                        Text(
                          widget.noRek,
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "RekeningTujuan",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nama"),
                        Text(
                          namaRekTujuan.toString(),
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nomor Rekening"),
                        Text(
                          noRekTujuan.toString(),
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white70,
                      alignment: Alignment.topLeft,
                      // height: 125,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Nominal Transfer",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              controller: _transferAmountController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(19),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              // textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                fillColor: Colors.pinkAccent,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                prefix: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'Rp ',
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              onChanged: (string) {
                                if (string.isNotEmpty) {
                                  string =
                                      _formatNumber(string.replaceAll(',', ''));
                                }
                                _transferAmountController.value =
                                    TextEditingValue(
                                  text: string,
                                  selection: TextSelection.collapsed(
                                      offset: string.length),
                                );
                              },
                            ),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                            // Text(
                            //   "Pastikan nominal yang anda masukkan benar.",
                            //   style: TextStyle(fontFamily: "Montserrat",color: Colors.grey[500]),
                            // )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white70,
                      // alignment: Alignment.topLeft,
                      // height: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Keterangan",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              controller: _keteranganController,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(19),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z0-9.,# ]'))
                              ],
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              // textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                fillColor: Colors.pinkAccent,
                                // labelText: 'Keterangan',
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4 + 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      M_PIN_PindahBukuModalDialog(
                        context,
                        widget.username,
                        widget.userid,
                        widget.noRek,
                        noRekTujuan.toString(),
                        namaRekTujuan.toString(),
                        int.parse(
                            _transferAmountController.text.replaceAll(",", "")),
                        _keteranganController.text,
                        widget.cust_no,
                        widget.lastLogin,
                        isChecked,
                      );
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(14),
                      child: Text(
                        "Transfer Saldo",
                        style: TextStyle(
                          fontFamily: "Montserrat",
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
    );
  }
}
