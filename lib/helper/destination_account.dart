// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/destination_account_cubit.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/transactions/pindah_buku/transfer_balance2.dart';

Future<dynamic> TransferSaldoButton(
  BuildContext context,
  String no_rek,
  String username,
  String userid,
  String cust_no,
  String lastLogin,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Daftar Transfer",
          textAlign: TextAlign.center,
        ),
        content: BlocProvider(
          create: (context) => DestinationAccountCubit(),
          child: BlocConsumer<DestinationAccountCubit, DestinationAccountState>(
            listener: (context, state) {
              if (state is DestinationAccountLoading) {
                print("Now is loading..");
              } else if (state is DestinationAccountError) {
                print(state.errorMsg);
                AlertMessage("Informasi", state.errorMsg, "OK", context);
              } else if (state is DestinationAccountSuccess) {
                if (state.response.status == "SUCCESS") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TransferBalance2(
                        noRek: no_rek,
                        username: username,
                        userid: userid,
                        cust_no: cust_no,
                        lastLogin: lastLogin,
                      ),
                    ),
                  );
                  // print(state.response.status.toString());
                } else {
                  AlertMessage("Informasi", "Terjadi Kesalahan", "OK", context);
                }
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  List<DstAccount> dstAccountList = [];
                  dstAccountList.clear();
                  DstAccount dstacc =
                      DstAccount(accountName: userid, accountNo: no_rek);
                  dstAccountList.add(dstacc);

                  final destinationAccountRequest = DestinationAccountRequest(
                      dstAccount: dstAccountList,
                      mpin: "123456",
                      procedure: "LOAD",
                      username: userid);

                  context
                      .read<DestinationAccountCubit>()
                      .dstAccountName(destinationAccountRequest);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icons/ic-quickmenu-9@3x.png',
                      width: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Transfer Saldo (PB)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.black87),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
