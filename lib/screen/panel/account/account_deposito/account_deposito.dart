// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_print, unnecessary_new, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/application/accountDeposito/cubit/account_deposito_detail_cubit.dart';
// import 'package:wincoremobile/application/accountDeposito/cubit/accountdeposito_cubit.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDepositoDetail_request.dart';
// import 'package:wincoremobile/domain/model/accountDeposito/accountDeposito_request.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDeposito_response.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/panel/account/account_deposito/account_deposito_detail.dart';

class AccountDeposito extends StatefulWidget {
  AccountDeposito({
    Key? key,
    required this.response,
    required this.userid,
    required this.no_rek,
    required this.username,
    required this.CIF,
    required this.mpin,
  }) : super(key: key);

  DepositoResponse response;
  String userid;
  String no_rek;
  String username;
  String CIF;
  String mpin;
  @override
  _AccountDepositoState createState() => _AccountDepositoState();
}

class _AccountDepositoState extends State<AccountDeposito> {
  final moneyFormat = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    var responseInfo = widget.response.info;
    var responseStatus = widget.response.status;
    var infoAccounts = responseInfo?.accounts!;
    // var eof = responseInfo?.eof;
    // var seqNo = responseInfo?.sequenceNo;
    // var infoStatusCode = responseInfo?.statusCode;

    print(responseStatus);
    // print(eof);
    // print("SeqNo : " + seqNo.toString());
    // print(infoStatusCode);

    // var seqNoNext = seqNo! + 5;
    // var seqNoPrev = seqNo - 5;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informasi Deposito",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xff120A7C),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFF2F2F4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          for (int x = 0; x < infoAccounts!.length; x++)
                            depositBarButton(
                              context,
                              infoAccounts[x].produkRekening.toString(),
                              infoAccounts[x].accountNo.toString(),
                              infoAccounts[x].status.toString(),
                              infoAccounts[x].mataUang.toString(),
                              infoAccounts[x].saldoEfektif.toString(),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: (seqNo > 1)
                  //           ? PrevPageButton(context, seqNoPrev)
                  //           : const ElevatedButton(
                  //               onPressed: null, child: Text("Sebelumnya")),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: (eof == true)
                  //           ? const ElevatedButton(
                  //               onPressed: null, child: Text("Selanjutnya"))
                  //           : NextPageButton(context, seqNoNext),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container depositBarButton(
    BuildContext context,
    String produkRekening,
    String accountNo,
    String status,
    String mataUang,
    String saldoEfektif,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      child: BlocProvider(
        create: (context) => AccountDepositoDetailCubit(),
        child: BlocConsumer<AccountDepositoDetailCubit,
            AccountDepositoDetailState>(
          listener: (context, state) {
            if (state is DepositoDetailLoading) {
              print("Now is loading..");
            } else if (state is DepositoDetailError) {
              print(state.errorMsg);
            } else if (state is DepositoDetailSuccess) {
              if (state.response.status == "OK") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AccountDepositoDetail(
                      response: state.response,
                      userid: widget.userid,
                      username: widget.username,
                      CIF: widget.CIF,
                      mpin: widget.mpin,
                      no_rek: widget.no_rek,
                      produk: produkRekening,
                    ),
                  ),
                );
              } else {
                AlertMessage("Informasi", "PIN Salah", "OK", context);
              }
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                ElevatedButton(
                  onPressed: () {
                    final depositoDetailRequest = DepositoDetailRequest(
                      username: widget.userid,
                      mpin: widget.mpin,
                      depositno: accountNo,
                    );

                    context
                        .read<AccountDepositoDetailCubit>()
                        .getDepositoDetail(depositoDetailRequest);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                produkRekening.toString().length > 22
                                    ? produkRekening.toString().substring(0, 27)
                                    : produkRekening.toString(),
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 12.5,
                                  color: Color(0xff120A7C),
                                ),
                              ),
                            ),
                            Text(
                              accountNo.toString() + " - " + status.toString(),
                              style: const TextStyle(
                                color: Color(0xff120A7C),
                                fontSize: 12.5,
                                fontFamily: "Montserrat",
                              ),
                            ),
                            Text(
                              mataUang.toString() +
                                  " " +
                                  moneyFormat.format(
                                      double.parse(saldoEfektif.toString())),
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.5,
                                color: Color(0xff120A7C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        child: Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: Color(0xff120A7C),
                        ),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // SizedBox PrevPageButton(BuildContext context, int seqNoPrev) {
  //   return SizedBox(
  //       child: BlocProvider(
  //     create: (context) => AccountdepositoCubit(),
  //     child: BlocConsumer<AccountdepositoCubit, AccountdepositoState>(
  //       listener: (context, state) {
  //         if (state is DepositoPagingLoading) {
  //           print("Now is loading..");
  //         } else if (state is DepositoPagingError) {
  //           print(state.errorMsg);
  //         } else if (state is DepositoPagingSuccess) {
  //           if (state.response.status == "OK") {
  //             Navigator.of(context).pushReplacement(
  //               MaterialPageRoute(
  //                 builder: (context) => AccountDeposito(
  //                     response: state.response,
  //                     username: widget.username,
  //                     no_rek: widget.no_rek,
  //                     userid: widget.userid,
  //                     mpin: widget.mpin,
  //                     CIF: widget.CIF),
  //               ),
  //             );

  //             print("Modal Change Page :");
  //             print(state.response.status.toString());
  //             // print(state.response.info?.eof.toString());
  //             // print(state.response.info?.sequenceNo.toString());
  //             print(state.response.info?.accounts?.toList().toString());
  //           } else {
  //             AlertMessage("Informasi", "PIN Salah", "OK", context);
  //           }
  //         }
  //       },
  //       builder: (context, state) {
  //         return Stack(
  //           children: <Widget>[
  //             Form(
  //               // key: _formKey,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   ElevatedButton(
  //                     child: const Text("Sebelumnya"),
  //                     onPressed: () {
  //                       final depositoRequest = DepositoRequest(
  //                         username: widget.userid,
  //                         mpin: widget.mpin,
  //                         sequenceno: seqNoPrev.toString(),
  //                         filter: "DEPOSITO",
  //                       );

  //                       context
  //                           .read<AccountdepositoCubit>()
  //                           .getDepositoPaging(depositoRequest);
  //                     },
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   ));
  // }

  // SizedBox NextPageButton(BuildContext context, int seqNoNext) {
  //   return SizedBox(
  //       child: BlocProvider(
  //     create: (context) => AccountdepositoCubit(),
  //     child: BlocConsumer<AccountdepositoCubit, AccountdepositoState>(
  //       listener: (context, state) {
  //         if (state is DepositoPagingLoading) {
  //           print("Now is loading..");
  //         } else if (state is DepositoPagingError) {
  //           print(state.errorMsg);
  //         } else if (state is DepositoPagingSuccess) {
  //           if (state.response.status == "OK") {
  //             Navigator.of(context).pushReplacement(MaterialPageRoute(
  //                 builder: (context) => AccountDeposito(
  //                       response: state.response,
  //                       username: widget.username,
  //                       no_rek: widget.no_rek,
  //                       userid: widget.userid,
  //                       mpin: widget.mpin,
  //                       CIF: widget.CIF,
  //                     )));

  //             // print("Modal Change Page :");
  //             // print(state.response.status.toString());
  //             // print(state.response.info?.eof.toString());
  //             // print(state.response.info?.sequenceNo.toString());
  //             // print(state.response.info?.mutasi
  //             //     ?.toList()
  //             //     .toString());
  //           } else {
  //             AlertMessage("Informasi", "PIN Salah", "OK", context);
  //           }
  //         }
  //       },
  //       builder: (context, state) {
  //         return Stack(
  //           children: <Widget>[
  //             Form(
  //               // key: _formKey,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   ElevatedButton(
  //                     child: const Text("Selanjutnya"),
  //                     onPressed: () {
  //                       final depositoRequest = DepositoRequest(
  //                           username: widget.userid,
  //                           mpin: widget.mpin,
  //                           sequenceno: seqNoNext.toString(),
  //                           filter: "DEPOSITO");

  //                       context
  //                           .read<AccountdepositoCubit>()
  //                           .getDepositoPaging(depositoRequest);
  //                     },
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   ));
  // }
}
