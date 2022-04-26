// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this, must_be_immutable, avoid_print,, non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:wincoremobile/domain/model/changePassword/changePass_request.dart';
import 'package:wincoremobile/application/changePass/cubit/change_pass_cubit.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

enum ValidationPasswordState {
  notset,
  samePasswordWithConfirm,
  diffPasswordWithConfirm,
}

class ChangePassword extends StatefulWidget {
  ChangePassword({
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
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _oldPassLamaController = TextEditingController();
  final _newPassLamaController = TextEditingController();
  final _rePassLamaController = TextEditingController();

  ValidationPasswordState currentPasswordState = ValidationPasswordState.notset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "",
      //     style: TextStyle(
      //       fontFamily: "Montserrat",
      //     ),
      //   ),
      //   backgroundColor: const Color(0xff120A7C),
      // ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocProvider(
            create: (context) => ChangePassCubit(),
            child: BlocConsumer<ChangePassCubit, ChangePassState>(
              listener: (context, state) {
                if (state is PassLoading) {
                  print("Now is loading");
                } else if (state is PassError) {
                  print(state.errorMsg);
                } else if (state is ChangePassSuccessRestoreState) {
                  print(state.chagesPassResponse);
                  if (state.chagesPassResponse.status == "CHANGE_OK") {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text(
                            "Informasi",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          content: const Text(
                            "Password kamu berhasil diperbarui !",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Home(
                                      username: widget.username,
                                      no_rek: widget.noRek,
                                      userid: widget.userid,
                                      cust_no: widget.cust_no,
                                      lastLogin: widget.last_login,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text(
                            "Informasi",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          content: const Text(
                            "Kata yang kamu masukkan tidak valid.",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Home(
                                      no_rek: widget.noRek,
                                      username: widget.username,
                                      userid: widget.userid,
                                      cust_no: widget.cust_no,
                                      lastLogin: widget.last_login,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ]),
                    );
                  }
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        const Text(
                          'Ubah Kata Sandi',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Container(
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              TextField(
                                controller: _oldPassLamaController,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                ),
                                /* inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ], */
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  labelText: 'Kata Sandi Lama',
                                  labelStyle: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.blue.shade700,
                                  ),
                                  isDense: true, // Added this
                                  contentPadding:
                                      const EdgeInsets.all(12), // Added this
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _newPassLamaController,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(
                                  //color: Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                ),
                                /* inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ], */
                                onChanged: (value) {
                                  if (value != _rePassLamaController.text ||
                                      value.length < 6) {
                                    setState(
                                      () {
                                        currentPasswordState =
                                            ValidationPasswordState
                                                .diffPasswordWithConfirm;
                                      },
                                    );
                                  } else if (value.length < 6) {
                                    setState(
                                      () {
                                        currentPasswordState =
                                            ValidationPasswordState
                                                .diffPasswordWithConfirm;
                                      },
                                    );
                                  } else {
                                    setState(() {
                                      currentPasswordState =
                                          ValidationPasswordState
                                              .diffPasswordWithConfirm;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  labelText: 'Kata Sandi Baru',
                                  labelStyle: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.blue.shade700,
                                  ),
                                  isDense: true, // Added this
                                  contentPadding:
                                      const EdgeInsets.all(12), // Added this
                                ),
                                validator: (value) {
                                  if (value != _rePassLamaController.text) {
                                    return 'Password tidak sama dengan yang diketikan ulang';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _rePassLamaController,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                ),
                                /* inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ], */
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  labelText: 'Ketik Ulang Kata Sandi Baru',
                                  labelStyle: TextStyle(
                                    //fontWeight: FontWeight.w900,
                                    fontFamily: "Montserrat",
                                    color: Colors.blue.shade700,
                                  ),
                                  isDense: true, // Added this
                                  contentPadding:
                                      const EdgeInsets.all(12), // Added this
                                ),
                                onChanged: (value) {
                                  if (value != _newPassLamaController.text) {
                                    setState(
                                      () {
                                        currentPasswordState =
                                            ValidationPasswordState
                                                .diffPasswordWithConfirm;
                                      },
                                    );
                                  } else if (value.length < 6) {
                                    setState(
                                      () {
                                        currentPasswordState =
                                            ValidationPasswordState
                                                .diffPasswordWithConfirm;
                                      },
                                    );
                                  } else {
                                    setState(() {
                                      currentPasswordState =
                                          ValidationPasswordState
                                              .samePasswordWithConfirm;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value != _newPassLamaController.text ||
                                      value!.length < 6) {
                                    return 'Password tidak sama dengan yang diketikan ulang';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 235,
                                margin: const EdgeInsets.only(top: 10),
                                child: (currentPasswordState ==
                                        ValidationPasswordState
                                            .samePasswordWithConfirm)
                                    ? ((state is PassLoading)
                                        ? _flatLoadingButton()
                                        : verifyButton(context))
                                    : disabledButton(),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  ElevatedButton changesMpinButton(BuildContext context) {
    return ElevatedButton(
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Kirim",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: "Montserrat",
          ),
        ),
      ),
      onPressed: () async {
        final mpinRequest = PassRequest(
          username: widget.userid,
          oldpass: _oldPassLamaController.text,
          newpass: _newPassLamaController.text,
        );

        context.read<ChangePassCubit>().changePass(mpinRequest);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
    );
  }

  ElevatedButton disabledButton() {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Kirim",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    );
  }

  ElevatedButton _flatLoadingButton() {
    return ElevatedButton(
      onPressed: null,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
    );
  }

  ElevatedButton verifyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final mpinRequest = PassRequest(
          username: widget.userid,
          oldpass: _oldPassLamaController.text,
          newpass: _newPassLamaController.text,
        );

        context.read<ChangePassCubit>().changePass(mpinRequest);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Kirim",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
