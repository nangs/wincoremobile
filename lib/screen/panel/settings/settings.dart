// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/destination_account_cubit.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/auth/change_mpin/change_mpin.dart';
import 'package:wincoremobile/screen/auth/change_password/change_password.dart';
import 'package:wincoremobile/screen/auth/forgot_mpin/forgot_mpin.dart';
// import 'package:wincoremobile/helper/icon_with_label.dart';
import 'package:wincoremobile/screen/panel/settings/administration/delete_dst_account.dart';

class Settings extends StatefulWidget {
  Settings({
    Key? key,
    required this.noRek,
    required this.username,
    required this.userid,
    required this.cust_no,
    required this.last_login,
  }) : super(key: key);

  String noRek;
  String username;
  String userid;
  String cust_no;
  String last_login;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pengaturan",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff120A7C),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFFF5F3F3),
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangePassword(
                                  noRek: widget.noRek,
                                  username: widget.username,
                                  userid: widget.userid,
                                  cust_no: widget.cust_no,
                                  last_login: widget.last_login,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/icons-new/icon_password.png',
                                width: 40,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Ubah Kata Sandi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 10,
                                  color: Colors.black87,
                                ),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangeMPIN(
                                  noRek: widget.noRek,
                                  username: widget.username,
                                  userid: widget.userid,
                                  cust_no: widget.cust_no,
                                  last_login: widget.last_login,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/icons-new/icon_change_m-pin.png',
                                width: 40,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Ubah M-PIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 10,
                                  color: Colors.black87,
                                ),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotMPin(
                                  noRek: widget.noRek,
                                  username: widget.username,
                                  userid: widget.userid,
                                  cust_no: widget.cust_no,
                                  last_login: widget.last_login,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/icons-new/icon_m-pin.png',
                                width: 40,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Lupa M-PIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 10,
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => DestinationAccountCubit(),
                    child: BlocConsumer<DestinationAccountCubit,
                        DestinationAccountState>(
                      listener: (context, state) {
                        if (state is DestinationAccountLoading) {
                          print("Now is loading..");
                        } else if (state is DestinationAccountError) {
                          print(state.errorMsg);
                          AlertMessage(
                              "Informasi", state.errorMsg, "OK", context);
                        } else if (state is DestinationAccountSuccess) {
                          if (state.response.status == "OK") {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DeleteDstAccount(
                                  response: state.response,
                                  userid: widget.userid,
                                  noRek: widget.noRek,
                                  username: widget.username,
                                  cust_no: widget.cust_no,
                                  last_login: widget.last_login,
                                ),
                              ),
                            );
                          }
                        } else {
                          AlertMessage(
                              "Informasi", "Terjadi Kesalahan", "OK", context);
                        }
                      },
                      builder: (context, state) {
                        return Padding(
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
                                  List<DstAccount> dstAccountList = [];
                                  dstAccountList.clear();
                                  DstAccount dstacc = DstAccount(
                                    accountName: widget.userid,
                                    accountNo: widget.noRek,
                                  );
                                  dstAccountList.add(dstacc);

                                  final destinationAccountRequest =
                                      DestinationAccountRequest(
                                          dstAccount: dstAccountList,
                                          mpin: "123456",
                                          procedure: "LOAD",
                                          username: widget.userid);

                                  context
                                      .read<DestinationAccountCubit>()
                                      .dstAccountName(
                                          destinationAccountRequest);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/icons-new/icon_hapus_daftar_transfer.png',
                                      width: 40,
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      "Hapus Daftar Transfer",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 10,
                                        color: Colors.black87,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
