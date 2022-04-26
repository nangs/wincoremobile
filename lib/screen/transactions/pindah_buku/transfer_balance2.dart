// ignore_for_file: must_be_immutable, avoid_print, non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/destination_account_cubit.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/konfirmasi_pindah_buku_cubit.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/transactions/pindah_buku/transfer_balance_confirmation.dart';

class TransferBalance2 extends StatefulWidget {
  TransferBalance2({
    Key? key,
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
  @override
  State<TransferBalance2> createState() => _TransferBalance2State();
}

class _TransferBalance2State extends State<TransferBalance2> {
  final _transferAmountController = TextEditingController();
  final _transferToController = TextEditingController();
  final _keteranganController = TextEditingController();

  late bool isFromDstAccountList;

  @override
  Widget build(BuildContext context) {
    const _locale = 'en';
    String _formatNumber(String s) =>
        NumberFormat.decimalPattern(_locale).format(int.parse(s));

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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocProvider(
            create: (context) => KonfirmasiPindahBukuCubit(),
            child: BlocConsumer<KonfirmasiPindahBukuCubit,
                KonfirmasiPindahBukuState>(
              listener: (context, state) {
                if (state is KonfirmasiPindahBukuLoading) {
                  print("Now is loading..");
                } else if (state is KonfirmasiPindahBukuError) {
                  print(state.errorMsg);
                } else if (state is KonfirmasiPindahBukuSuccess) {
                  if (state.response.status == "OK") {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => TransferBalanceConfirmation(
                          response: state.response,
                          noRek: widget.noRek,
                          username: widget.username,
                          userid: widget.userid,
                          jmlTransfer: _transferAmountController.text
                              .replaceAll(",", ""),
                          keterangan: _keteranganController.text,
                          cust_no: widget.cust_no,
                          lastLogin: widget.lastLogin,
                          isFromDstAccountList: isFromDstAccountList,
                        ),
                      ),
                    );
                    // print(state.accActivitiesResponse.status.toString());
                    // print(state.accActivitiesResponse.info?.eof.toString());
                    // print(state.accActivitiesResponse.info?.sequenceNo.toString());
                    // print(state.accActivitiesResponse.info?.mutasi?.toList().toString());
                  } else {
                    AlertMessage("Informasi", "PIN Salah", "OK", context);
                  }
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.white,
                                  alignment: Alignment.topLeft,
                                  // height: 110,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Rekening Tujuan",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Color(0xff120A7C),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        TextFormField(
                                          controller: _transferToController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                19),
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 18,
                                            color: Color(0xff120A7C),
                                            // fontWeight: FontWeight.bold,
                                          ),
                                          onChanged: (value) {
                                            isFromDstAccountList = false;
                                          },
                                          // textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                            prefix: SizedBox(
                                              width: 35,
                                              child: BlocProvider(
                                                create: (context) =>
                                                    DestinationAccountCubit(),
                                                child: BlocConsumer<
                                                    DestinationAccountCubit,
                                                    DestinationAccountState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is DestinationAccountLoading) {
                                                      print("Now is loading..");
                                                    } else if (state
                                                        is DestinationAccountError) {
                                                      print(state.errorMsg);
                                                      AlertMessage(
                                                          "Informasi",
                                                          state.errorMsg,
                                                          "OK",
                                                          context);
                                                    } else if (state
                                                        is DestinationAccountSuccess) {
                                                      if (state.response
                                                              .status ==
                                                          "OK") {
                                                        showDialog(
                                                          context: context,
                                                          useSafeArea: true,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              scrollable: true,
                                                              title: state
                                                                      .response
                                                                      .info!
                                                                      .dstAccount!
                                                                      .isEmpty
                                                                  ? const Text(
                                                                      "")
                                                                  : const Text(
                                                                      "Daftar Transfer",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontSize:
                                                                            16,
                                                                        color: Color(
                                                                            0xff120A7C),
                                                                      ),
                                                                    ),
                                                              content: Column(
                                                                children: <
                                                                    Widget>[
                                                                  if (state
                                                                      .response
                                                                      .info!
                                                                      .dstAccount!
                                                                      .isEmpty)
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              MediaQuery.of(context).size.height / 9,
                                                                          child:
                                                                              const Text(
                                                                            "Belum ada Rekening Tujuan yang terdaftar",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: "Montserrat",
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  for (int i =
                                                                          0;
                                                                      i <
                                                                          state
                                                                              .response
                                                                              .info!
                                                                              .dstAccount!
                                                                              .length;
                                                                      i++)
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        _transferToController.text = state
                                                                            .response
                                                                            .info!
                                                                            .dstAccount![i]
                                                                            .accountNo
                                                                            .toString();

                                                                        isFromDstAccountList =
                                                                            true;

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Text(
                                                                            state.response.info!.dstAccount![i].accountName.toString(),
                                                                            style:
                                                                                const TextStyle(
                                                                              fontFamily: "Montserrat",
                                                                            ),
                                                                          ),
                                                                          const Text(
                                                                            " - ",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: "Montserrat",
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            state.response.info!.dstAccount![i].accountNo.toString(),
                                                                            style:
                                                                                const TextStyle(
                                                                              fontFamily: "Montserrat",
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      AlertMessage(
                                                          "Informasi",
                                                          "Terjadi Kesalahan",
                                                          "OK",
                                                          context);
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    return MaterialButton(
                                                      minWidth: 3,
                                                      child: const FaIcon(
                                                        FontAwesomeIcons
                                                            .magnifyingGlass,
                                                        size: 15,
                                                        color:
                                                            Color(0xff120A7C),
                                                      ),
                                                      onPressed: () {
                                                        List<DstAccount>
                                                            dstAccountList = [];
                                                        dstAccountList.clear();
                                                        DstAccount dstacc =
                                                            DstAccount(
                                                          accountName:
                                                              widget.userid,
                                                          accountNo:
                                                              widget.noRek,
                                                        );
                                                        dstAccountList
                                                            .add(dstacc);

                                                        final destinationAccountRequest =
                                                            DestinationAccountRequest(
                                                                dstAccount:
                                                                    dstAccountList,
                                                                mpin: "123456",
                                                                procedure:
                                                                    "LOAD",
                                                                username: widget
                                                                    .userid);

                                                        context
                                                            .read<
                                                                DestinationAccountCubit>()
                                                            .dstAccountName(
                                                                destinationAccountRequest);
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            labelStyle: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 18),
                                            fillColor: Colors.pinkAccent,
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    10, 0, 10, 0),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black12),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black12),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          // onChanged: (string) {
                                          //   string = _formatNumber(string.replaceAll('.', ''));
                                          //   _transferToController.value = TextEditingValue(
                                          //     text: string,
                                          //     selection:
                                          //         TextSelection.collapsed(offset: string.length),
                                          //   );
                                          // },
                                        ),
                                        // Text(
                                        //   "Pastikan nomor rekening tujuan yang anda masukkan benar.",
                                        //   style: TextStyle(fontFamily: "Montserrat",color: Colors.grey[500]),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  alignment: Alignment.topLeft,
                                  // height: 125,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Nominal Transfer",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Color(0xff120A7C),
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
                                            LengthLimitingTextInputFormatter(
                                                19),
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[0-9]'))
                                          ],
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 18,
                                            // fontWeight: FontWeight.bold,
                                            color: Color(0xff120A7C),
                                          ),
                                          // textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                            fillColor: Colors.pinkAccent,
                                            contentPadding:
                                                const EdgeInsets.fromLTRB(
                                                    10, 0, 10, 0),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black12),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black12),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            prefix: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: Text(
                                                'Rp ',
                                                style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 16,
                                                  color: Color(0xff120A7C),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChanged: (string) {
                                            if (string.isNotEmpty) {
                                              string = _formatNumber(
                                                  string.replaceAll(',', ''));
                                            }
                                            _transferAmountController.value =
                                                TextEditingValue(
                                              text: string,
                                              selection:
                                                  TextSelection.collapsed(
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
                                // const SizedBox(
                                //   height: 8,
                                // ),
                                Container(
                                  color: Colors.white,
                                  // alignment: Alignment.topLeft,
                                  // height: 160,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            "Keterangan",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Color(0xff120A7C),
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
                                            LengthLimitingTextInputFormatter(
                                                19),
                                            FilteringTextInputFormatter.allow(
                                                RegExp('[a-zA-Z0-9.,# ]'))
                                          ],
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 18,
                                            // fontWeight: FontWeight.bold,
                                            color: Color(0xff120A7C),
                                          ),
                                          // textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                            fillColor: Colors.pinkAccent,
                                            // labelText: 'Keterangan',
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black12),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black12),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.of(context).size.height / 8 + 15,
                                // ),
                                Center(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_transferAmountController
                                                  .text.isEmpty ||
                                              _transferToController
                                                  .text.isEmpty) {
                                            AlertMessage(
                                                "Informasi",
                                                "Mohon periksa kembali inputan anda.",
                                                "OK",
                                                context);
                                          } else if (int.parse(
                                                  _transferAmountController.text
                                                      .replaceAll(",", "")) <
                                              10000) {
                                            AlertMessage(
                                                "Informasi",
                                                "Nominal minimum transfer adalah Rp 10.000",
                                                "OK",
                                                context);
                                            // }
                                            // else if (_transferToController.text ==
                                            //     widget.noRek) {
                                            //   AlertMessage(
                                            //       "Informasi",
                                            //       "Rekening Penerima harus Berbeda dengan Rekening Sumber Dana Transfer",
                                            //       "OK",
                                            //       context);
                                          } else {
                                            final request =
                                                TransferConfirmationPBRequest(
                                              accountno:
                                                  _transferToController.text,
                                            );

                                            context
                                                .read<
                                                    KonfirmasiPindahBukuCubit>()
                                                .getAccountName(request);
                                          }
                                        },
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue.shade900),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(14),
                                          child: Text(
                                            "Konfirmasi Transfer",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
