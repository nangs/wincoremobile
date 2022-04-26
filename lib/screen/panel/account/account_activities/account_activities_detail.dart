// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, camel_case_types, unnecessary_new, avoid_print

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/application/accountActivities/cubit/acc_activities_cubit.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_request.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_response.dart';
import 'package:wincoremobile/helper/alert_message.dart';
// import 'package:wincoremobile/helper/modal.dart';

class AccountActivitiesDetails extends StatefulWidget {
  AccountActivitiesDetails({
    Key? key,
    required this.response,
    required this.username,
    required this.userid,
    required this.mpin,
    required this.startDate,
    required this.endDate,
    required this.noRek,
  }) : super(key: key);

  AccountActivitiesResponse response;
  String noRek;
  String username;
  String startDate;
  String endDate;
  String userid;
  String mpin;

  @override
  State<AccountActivitiesDetails> createState() =>
      _AccountActivitiesDetailsState();
}

class _AccountActivitiesDetailsState extends State<AccountActivitiesDetails> {
  @override
  Widget build(BuildContext context) {
    var responseInfo = widget.response.info;

    var mutasiList = responseInfo?.mutasi;
    var eof = responseInfo?.eof;
    var seqNo = responseInfo?.sequenceNo;

    var seqNoNext = seqNo! + 9;
    var seqNoPrev = seqNo - 9;
    // String isDebitKredit = "K";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mutasi Rekening"),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage("assets/images/Background1.png"),
            //     fit: BoxFit.cover),
            color: Color(0xff120A7C),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                            ),
                            // height: 90,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 10, 8),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "No Rekening : " + widget.noRek,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Montserrat",
                                              color: Colors.blue.shade800),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Periode : ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Montserrat",
                                                color: Colors.blue.shade800),
                                          ),
                                          Text(
                                            widget.startDate,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Montserrat",
                                                color: Colors.blue.shade800),
                                          ),
                                          Text(
                                            " - ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Montserrat",
                                                color: Colors.blue.shade800),
                                          ),
                                          Text(widget.endDate,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Montserrat",
                                                  color: Colors.blue.shade800)),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Tanggal Inquiry : " +
                                              DateFormat("yyyy/MM/dd")
                                                  .format(DateTime.now()),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Montserrat",
                                              color: Colors.blue.shade800),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    for (int x = 0; x < mutasiList!.length; x++)
                                      // if (mutasiList[x].signTransaksi.toString() ==
                                      //     isDebitKredit)
                                      accActivityDetails(
                                        user_input:
                                            mutasiList[x].userInput.toString(),
                                        jam_input:
                                            mutasiList[x].jamInput.toString(),
                                        keterangan_1: mutasiList[x]
                                            .keterangan1
                                            .toString(),
                                        keterangan_2: mutasiList[x]
                                            .keterangan2
                                            .toString(),
                                        mata_uang:
                                            mutasiList[x].mataUang.toString(),
                                        nilai_transaksi: mutasiList[x]
                                            .nilaiTransaksi
                                            .toString(),
                                        no_referensi: mutasiList[x]
                                            .noReferensi
                                            .toString(),
                                        sign_transaksi: mutasiList[x]
                                            .signTransaksi
                                            .toString(),
                                        tanggal_posting: mutasiList[x]
                                            .tanggalPosting
                                            .toString(),
                                        tanggal_valuta: mutasiList[x]
                                            .tanggalValuta
                                            .toString(),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (seqNo > 1)
                                    ? PrevPageButton(context, seqNoPrev)
                                    : ElevatedButton(
                                        onPressed: null,
                                        child: Text("Sebelumnya"),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (eof == true)
                                    ? ElevatedButton(
                                        onPressed: null,
                                        child: Text("Selanjutnya"),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      )
                                    : NextPageButton(context, seqNoNext),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox PrevPageButton(BuildContext context, int seqNoPrev) {
    return SizedBox(
        child: BlocProvider(
      create: (context) => AccActivitiesCubit(),
      child: BlocConsumer<AccActivitiesCubit, AccActivitiesState>(
        listener: (context, state) {
          if (state is AccActivitiesPagingLoading) {
            print("Now is loading..");
          } else if (state is AccActivitiesPagingError) {
            print(state.errorMsg);
          } else if (state is AccActivitiesPagingSuccess) {
            if (state.accActivitiesResponse.status == "OK") {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AccountActivitiesDetails(
                      response: state.accActivitiesResponse,
                      username: widget.username,
                      noRek: widget.noRek,
                      startDate: widget.startDate,
                      endDate: widget.endDate,
                      userid: widget.userid,
                      mpin: widget.mpin)));

              print("Modal Change Page :");
              print(state.accActivitiesResponse.status.toString());
              print(state.accActivitiesResponse.info?.eof.toString());
              print(state.accActivitiesResponse.info?.sequenceNo.toString());
              print(state.accActivitiesResponse.info?.mutasi
                  ?.toList()
                  .toString());
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
                        final accActivitiesRequest = AccountActivitiesRequest(
                            accountno: widget.noRek,
                            username: widget.userid,
                            mpin: widget.mpin,
                            enddate: widget.endDate.replaceAll("/", ""),
                            startdate: widget.startDate.replaceAll("/", ""),
                            sequenceno: seqNoPrev.toString());

                        context
                            .read<AccActivitiesCubit>()
                            .getAccountActivitiesPaging(accActivitiesRequest);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade900),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
      create: (context) => AccActivitiesCubit(),
      child: BlocConsumer<AccActivitiesCubit, AccActivitiesState>(
        listener: (context, state) {
          if (state is AccActivitiesPagingLoading) {
            print("Now is loading..");
          } else if (state is AccActivitiesPagingError) {
            print(state.errorMsg);
          } else if (state is AccActivitiesPagingSuccess) {
            if (state.accActivitiesResponse.status == "OK") {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AccountActivitiesDetails(
                      response: state.accActivitiesResponse,
                      username: widget.username,
                      noRek: widget.noRek,
                      startDate: widget.startDate,
                      endDate: widget.endDate,
                      userid: widget.userid,
                      mpin: widget.mpin)));

              print("Modal Change Page :");
              print(state.accActivitiesResponse.status.toString());
              print(state.accActivitiesResponse.info?.eof.toString());
              print(state.accActivitiesResponse.info?.sequenceNo.toString());
              print(state.accActivitiesResponse.info?.mutasi
                  ?.toList()
                  .toString());
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
                        final accActivitiesRequest = AccountActivitiesRequest(
                            accountno: widget.noRek,
                            username: widget.userid,
                            mpin: widget.mpin,
                            enddate: widget.endDate.replaceAll("/", ""),
                            startdate: widget.startDate.replaceAll("/", ""),
                            sequenceno: seqNoNext.toString());

                        context
                            .read<AccActivitiesCubit>()
                            .getAccountActivitiesPaging(accActivitiesRequest);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade900),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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

class accActivityDetails extends StatefulWidget {
  accActivityDetails(
      {Key? key,
      required this.keterangan_1,
      required this.keterangan_2,
      required this.nilai_transaksi,
      required this.user_input,
      required this.jam_input,
      required this.tanggal_valuta,
      required this.no_referensi,
      required this.mata_uang,
      required this.sign_transaksi,
      required this.tanggal_posting})
      : super(key: key);
  String keterangan_1;
  String keterangan_2;
  String nilai_transaksi;
  String user_input;
  String jam_input;
  String tanggal_valuta;
  String no_referensi;
  String mata_uang;
  String sign_transaksi;
  String tanggal_posting;

  @override
  State<accActivityDetails> createState() => _accActivityDetailsState();
}

class _accActivityDetailsState extends State<accActivityDetails> {
  final moneyFormat = new NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    var Jam = widget.jam_input.toString().substring(0, 2);
    var Menit = widget.jam_input.toString().substring(2, 4);
    var Detik = widget.jam_input.toString().substring(4, 6);

    var tglPostingYear = widget.tanggal_posting.toString().substring(0, 4);
    var tglPostingMonth = widget.tanggal_posting.toString().substring(4, 6);
    var tglPostingDay = widget.tanggal_posting.toString().substring(6, 8);

    var tglValutaYear = widget.tanggal_valuta.toString().substring(0, 4);
    var tglValutaMonth = widget.tanggal_valuta.toString().substring(4, 6);
    var tglValutaDay = widget.tanggal_valuta.toString().substring(6, 8);

    var jamPosting = Jam + ":" + Menit + ":" + Detik;
    var tglPosting =
        tglPostingYear + "/" + tglPostingMonth + "/" + tglPostingDay;
    // ignore: unused_local_variable
    var tglValuta = tglValutaYear + "/" + tglValutaMonth + "/" + tglValutaDay;

    return Wrap(
      children: [
        Text(
          tglPosting + " - " + jamPosting,
          style: TextStyle(
            fontSize: 10,
            //fontWeight: FontWeight.bold,
            color: Colors.blue.shade800,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.user_input + " " + widget.keterangan_2,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  Text(
                    widget.keterangan_1 + " " + widget.keterangan_2,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Ref No : " + widget.no_referensi,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Montserrat",
                      //fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.mata_uang,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: (widget.sign_transaksi == "D")
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                  Text(
                    moneyFormat.format(
                        double.parse(widget.nilai_transaksi.toString())),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: (widget.sign_transaksi == "D")
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    (widget.sign_transaksi == "D")
                        ? "DB"
                        : ((widget.sign_transaksi == "K") ? "CR" : ""),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: (widget.sign_transaksi == "D")
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(color: Colors.black)
        // Container(
        //   margin: EdgeInsets.all(8),
        //   // padding: EdgeInsets.all(8),
        //   decoration:
        //       BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        // )
      ],
    );
  }
}
