// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wincoremobile/application/accountActivities/cubit/acc_activities_cubit.dart';
import 'package:wincoremobile/application/accountBalance/cubit/account_balance_cubit.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_request.dart';
import 'package:wincoremobile/domain/model/accountInformation/accInformation_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/panel/account/account_activities_detail.dart';
import 'package:wincoremobile/screen/panel/account/account_balance.dart';

Future<dynamic> modalBottomSheetPembayaran(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(FontAwesomeIcons.moneyBill),
                                      SizedBox(height: 20),
                                      Text(
                                        "Pulsa",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.bolt,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Token Listrik",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.briefcaseMedical,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Asuransi",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Settings()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(FontAwesomeIcons.water),
                                      SizedBox(height: 20),
                                      Text(
                                        "PDAM",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.phone,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Telepon",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.phone_android,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Pascabayar",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.wifi,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "TV Kabel & Internet",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.solidHandshake,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Pinjaman",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.local_play_rounded,
                                        size: 30,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Voucher",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.creditCard,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Kartu Kredit",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
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
        );
      });
}

Future<dynamic> M_PIN_AccInfoModalDialog(
    BuildContext context, String username, String userid, String accountNo) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "M-PIN",
            textAlign: TextAlign.center,
          ),
          content: BlocProvider(
            create: (context) => AccountBalanceCubit(),
            child: BlocConsumer<AccountBalanceCubit, AccountBalanceState>(
              listener: (context, state) {
                if (state is AccountBalanceLoading) {
                  print("Now is loading..");
                } else if (state is AccountBalanceError) {
                  print(state.errorMsg);
                } else if (state is AccountBalanceSuccess) {
                  if (state.accountInfoResponse.status == "OK") {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AccountBalance(
                              response: state.accountInfoResponse,
                            )));
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
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'M-PIN',
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
                          ElevatedButton(
                            child: const Text("Submit"),
                            onPressed: () {
                              final accInfoRequest = AccountInfoRequest(
                                  accountno: accountNo,
                                  username: userid,
                                  mpin: _MPINController.text);

                              context
                                  .read<AccountBalanceCubit>()
                                  .getAccountInfo(accInfoRequest);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}

Future<dynamic> M_PIN_AccActivitiesModalDialog(
    BuildContext context,
    String username,
    String userid,
    String accountNo,
    String startDate,
    String endDate,
    String seqNo) {
  final _MPINController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "M-PIN",
            textAlign: TextAlign.center,
          ),
          content: BlocProvider(
            create: (context) => AccActivitiesCubit(),
            child: BlocConsumer<AccActivitiesCubit, AccActivitiesState>(
              listener: (context, state) {
                if (state is AccActivitiesLoading) {
                  print("Now is loading..");
                } else if (state is AccActivitiesError) {
                  print(state.errorMsg);
                } else if (state is AccActivitiesSuccess) {
                  if (state.accActivitiesResponse.status == "OK") {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AccountActivitiesDetails(
                            response: state.accActivitiesResponse,
                            username: username,
                            noRek: accountNo,
                            startDate: startDate,
                            endDate: endDate,
                            userid: userid,
                            mpin: _MPINController.text)));
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
                return Stack(
                  children: <Widget>[
                    Form(
                      // key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            controller: _MPINController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'M-PIN',
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
                          ElevatedButton(
                            child: const Text("Submit"),
                            onPressed: () {
                              final accActivitiesRequest =
                                  AccountActivitiesRequest(
                                      accountno: accountNo,
                                      username: userid,
                                      mpin: _MPINController.text,
                                      enddate: endDate,
                                      startdate: startDate,
                                      sequenceno: seqNo);

                              context
                                  .read<AccActivitiesCubit>()
                                  .getAccountInfo(accActivitiesRequest);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      });
}
