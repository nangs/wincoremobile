// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/forgotPassword/cubit/forgot_password_new_pass_cubit.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_request.dart';
import 'package:wincoremobile/screen/auth/sign_in/sign_in.dart';

class ForgotPasswordStep2 extends StatefulWidget {
  ForgotPasswordStep2({Key? key, required this.phoneNo, required this.username})
      : super(key: key);

  String phoneNo;
  String username;

  @override
  _ForgotPasswordStep2State createState() => _ForgotPasswordStep2State();
}

class _ForgotPasswordStep2State extends State<ForgotPasswordStep2> {
  final _passwordController = TextEditingController();
  final _passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F4),
      body: BlocProvider(
        create: (context) => ForgotPasswordNewPassCubit(),
        child: BlocConsumer<ForgotPasswordNewPassCubit,
            ForgotPasswordNewPassState>(
          listener: (context, state) {
            if (state is ForgotPasswordErrorState) {
              print(state.errorMsg);
            } else if (state is ForgotPasswordLoadingState) {
              print("Now is Loading");
            } else if (state is ForgotPasswordSuccessChangePasswordState) {
              print(state.forgotPasswordResponse);
              if (state.forgotPasswordResponse.status == "CHANGE_OK") {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: Text(
                        "Hi, " + widget.username,
                        style: const TextStyle(fontFamily: "Montserrat"),
                      ),
                      content: const Text(
                        "Passwordmu berhasil diperbaharui !",
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(fontFamily: "Montserrat"),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
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
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                      content: const Text(
                        "Data Nasabah Tidak Ditemukan.",
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text(
                            'OK',
                            style: TextStyle(fontFamily: "Montserrat"),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                        ),
                      ]),
                );
              }
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 18,
                      // ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        // decoration: BoxDecoration(
                        //   color: Colors.deepPurple.shade50,
                        //   shape: BoxShape.circle,
                        // ),
                        child: Image.asset(
                          'assets/images/icons-new/icon_password.png',
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Kata Sandi Baru',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff120A7C),
                          fontFamily: "Montserrat",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Hore!! Sekarang kamu dapat mengakses kembali akunmu dengan Kata Sandi yang baru.",
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Color(0xff120A7C),
                            fontFamily: "Montserrat",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                                color: Color(0xff120A7C),
                              ),
                              decoration: InputDecoration(
                                labelText: 'Kata Sandi Baru',
                                labelStyle: const TextStyle(
                                  color: Color(0xff120A7C),
                                  fontFamily: "Montserrat",
                                ),
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
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _passwordRetypeController,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                                color: Color(0xff120A7C),
                              ),
                              decoration: InputDecoration(
                                labelText: 'Ketik Ulang Kata Sandi Baru',
                                labelStyle: const TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                ),
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
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: (_passwordController.text ==
                                      _passwordRetypeController.text)
                                  ? ((state is ForgotPasswordLoadingState)
                                      ? _flatLoadingButton()
                                      : _flatChangePasswordButton(context))
                                  : _flatDisabledChangePasswordButton(context),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ElevatedButton _flatDisabledChangePasswordButton(BuildContext context) {
    return ElevatedButton(
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
          ),
        ),
      ),
      onPressed: null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  ElevatedButton _flatChangePasswordButton(BuildContext context) {
    return ElevatedButton(
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
          ),
        ),
      ),
      onPressed: () async {
        final forgotPasswordSetNewPassRequest = ForgotPasswordSetNewPassRequest(
            username: widget.username,
            phonenum: widget.phoneNo,
            newpass: _passwordController.text,
            procedure: "CHANGE");

        context
            .read<ForgotPasswordNewPassCubit>()
            .forgotPasswordSetNewPassword(forgotPasswordSetNewPassRequest);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff120A7C)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  ElevatedButton _flatLoadingButton() {
    return ElevatedButton(
      onPressed: null,
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff120A7C)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
