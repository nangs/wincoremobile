// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_print, unnecessary_new, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/application/accountPinjaman/cubit/account_pinjaman_detail_cubit.dart';
import 'package:wincoremobile/application/accountPinjaman/cubit/accountpinjaman_cubit.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjamanDetail_request.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjaman_request.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjaman_response.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/panel/account/account_pinjaman/account_pinjaman_detail.dart';

class AccountPinjaman extends StatefulWidget {
  AccountPinjaman({
    Key? key,
    required this.response,
    required this.userid,
    required this.no_rek,
    required this.username,
    required this.CIF,
    required this.mpin,
  }) : super(key: key);

  PinjamanResponse response;
  String userid;
  String no_rek;
  String username;
  String CIF;
  String mpin;
  @override
  _AccountPinjamanState createState() => _AccountPinjamanState();
}

class _AccountPinjamanState extends State<AccountPinjaman> {
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
        title: const Text("Informasi Pinjaman"),
        backgroundColor: const Color(0xff120A7C),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xFFF2F2F4),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        for (int x = 0; x < infoAccounts!.length; x++)
                          pinjamanBarButton(
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

  Container pinjamanBarButton(
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
        create: (context) => AccountPinjamanDetailCubit(),
        child: BlocConsumer<AccountPinjamanDetailCubit,
            AccountPinjamanDetailState>(
          listener: (context, state) {
            if (state is PinjamanDetailLoading) {
              print("Now is loading..");
            } else if (state is PinjamanDetailError) {
              print(state.errorMsg);
            } else if (state is PinjamanDetailSuccess) {
              if (state.response.status == "OK") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AccountPinjamanDetail(
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
                    final depositoDetailRequest = PinjamanDetailRequest(
                      username: widget.userid,
                      mpin: widget.mpin,
                      loanno: accountNo,
                    );

                    context
                        .read<AccountPinjamanDetailCubit>()
                        .getPinjamanDetail(depositoDetailRequest);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                produkRekening.toString(),
                                style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.5),
                              ),
                            ),
                            Text(accountNo.toString() +
                                " - " +
                                status.toString()),
                            Text(
                              mataUang.toString() +
                                  " " +
                                  moneyFormat.format(
                                      double.parse(saldoEfektif.toString())),
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        child: Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff120A7C)),
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

  SizedBox PrevPageButton(BuildContext context, int seqNoPrev) {
    return SizedBox(
        child: BlocProvider(
      create: (context) => AccountpinjamanCubit(),
      child: BlocConsumer<AccountpinjamanCubit, AccountpinjamanState>(
        listener: (context, state) {
          if (state is PinjamanPagingLoading) {
            print("Now is loading..");
          } else if (state is PinjamanPagingError) {
            print(state.errorMsg);
          } else if (state is PinjamanPagingSuccess) {
            if (state.response.status == "OK") {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AccountPinjaman(
                      response: state.response,
                      username: widget.username,
                      no_rek: widget.no_rek,
                      userid: widget.userid,
                      mpin: widget.mpin,
                      CIF: widget.CIF),
                ),
              );

              print("Modal Change Page :");
              print(state.response.status.toString());
              // print(state.response.info?.eof.toString());
              // print(state.response.info?.sequenceNo.toString());
              print(state.response.info?.accounts?.toList().toString());
            } else {
              AlertMessage("Informasi", "PIN Salah", "OK", context);
            }
          }
        },
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              Form(
                // key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text("Sebelumnya"),
                      onPressed: () {
                        final pinjamanRequest = PinjamanRequest(
                          username: widget.userid,
                          mpin: widget.mpin,
                          sequenceno: seqNoPrev.toString(),
                          filter: "PINJAMAN",
                        );

                        context
                            .read<AccountpinjamanCubit>()
                            .getPinjamanPaging(pinjamanRequest);
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
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  SizedBox NextPageButton(BuildContext context, int seqNoNext) {
    return SizedBox(
        child: BlocProvider(
      create: (context) => AccountpinjamanCubit(),
      child: BlocConsumer<AccountpinjamanCubit, AccountpinjamanState>(
        listener: (context, state) {
          if (state is PinjamanPagingLoading) {
            print("Now is loading..");
          } else if (state is PinjamanPagingError) {
            print(state.errorMsg);
          } else if (state is PinjamanPagingSuccess) {
            if (state.response.status == "OK") {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AccountPinjaman(
                        response: state.response,
                        username: widget.username,
                        no_rek: widget.no_rek,
                        userid: widget.userid,
                        mpin: widget.mpin,
                        CIF: widget.CIF,
                      )));

              // print("Modal Change Page :");
              // print(state.response.status.toString());
              // print(state.response.info?.eof.toString());
              // print(state.response.info?.sequenceNo.toString());
              // print(state.response.info?.mutasi
              //     ?.toList()
              //     .toString());
            } else {
              AlertMessage("Informasi", "PIN Salah", "OK", context);
            }
          }
        },
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              Form(
                // key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: const Text("Selanjutnya"),
                      onPressed: () {
                        final pinjamanRequest = PinjamanRequest(
                            username: widget.userid,
                            mpin: widget.mpin,
                            sequenceno: seqNoNext.toString(),
                            filter: "PINJAMAN");

                        context
                            .read<AccountpinjamanCubit>()
                            .getPinjamanPaging(pinjamanRequest);
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
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
