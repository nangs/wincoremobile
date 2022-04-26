// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_response.dart';
import 'package:wincoremobile/helper/modal.dart';

class DeleteDstAccount extends StatefulWidget {
  DeleteDstAccount({
    Key? key,
    required this.response,
    required this.userid,
    required this.noRek,
    required this.username,
    required this.cust_no,
    required this.last_login,
  }) : super(key: key);

  DestinationAccountLoadResponse response;
  String userid;
  String noRek;
  String username;
  String cust_no;
  String last_login;

  @override
  State<DeleteDstAccount> createState() => _DeleteDstAccountState();
}

class _DeleteDstAccountState extends State<DeleteDstAccount> {
  @override
  Widget build(BuildContext context) {
    var response = widget.response;
    var dstAccount = response.info?.dstAccount;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text(
          'Hapus Daftar Transfer',
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff120A7C),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                if (dstAccount!.isEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Data tidak ditemukan",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontFamily: "Montserrat",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                for (int x = 0; x < dstAccount.length; x++)
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          M_PIN_DeleteDstAccountModalDialog(
                            context,
                            dstAccount[x].accountName.toString(),
                            dstAccount[x].accountNo.toString(),
                            widget.userid,
                            widget.username,
                            widget.noRek,
                            widget.cust_no,
                            widget.last_login,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dstAccount[x].accountName.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      color: Color(0xff120A7C),
                                    ),
                                  ),
                                  Text(
                                    dstAccount[x].accountNo.toString(),
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Color(0xff120A7C),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: Image.asset(
                                  'assets/images/icons-new/trash.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
