// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/forgotPassword/cubit/forgot_password_validate_cubit.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_request.dart';
import 'package:wincoremobile/screen/auth/forgot_password/forgot_password_step2.dart';
import 'package:wincoremobile/screen/auth/forgot_password/forgot_password_verification.dart';
import 'package:wincoremobile/screen/auth/sign_in/sign_in.dart';

class ForgotPasswordStep1 extends StatefulWidget {
  ForgotPasswordStep1({Key? key, required this.phone_no}) : super(key: key);

  String phone_no;
  @override
  State<ForgotPasswordStep1> createState() => _ForgotPasswordStep1State();
}

class _ForgotPasswordStep1State extends State<ForgotPasswordStep1> {
  final _usernameController = TextEditingController();

  ElevatedButton loadingButton() {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF120A7C)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(14.0),
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }

  ElevatedButton verifyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final forgotPasswordValidateRequest = ForgotPasswordValidateRequest(
          username: _usernameController.text,
          phonenum: widget.phone_no,
          procedure: "VALIDATE",
        );

        context
            .read<ForgotPasswordValidateCubit>()
            .forgotPasswordValidateData(forgotPasswordValidateRequest);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF120A7C)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            "Kirim",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF2F2F4),
        body: BlocProvider(
          create: (context) => ForgotPasswordValidateCubit(),
          child: BlocConsumer<ForgotPasswordValidateCubit,
              ForgotPasswordValidateState>(
            listener: (context, state) {
              if (state is ForgotPasswordErrorState) {
                print(state.errorMsg);
              } else if (state is ForgotPasswordLoadingState) {
                print("Now is Loading");
              } else if (state is ForgotPasswordValidateSuccessState) {
                print(state.forgotPasswordResponse);
                if (state.forgotPasswordResponse.status == "VALIDATE_OK") {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordStep2(
                          phoneNo: widget.phone_no,
                          username: _usernameController.text),
                    ),
                  );
                } else if (state.forgotPasswordResponse.status ==
                    "INVALID_PHONENUM") {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordVerification(
                        username: _usernameController.text,
                        phone_no: widget.phone_no,
                      ),
                    ),
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
                          "Username atau Nomor Telepon yang kamu input salah",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 32),
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
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: 150,
                          height: 150,
                          // decoration: BoxDecoration(
                          //   color: Colors.deepPurple.shade50,
                          //   shape: BoxShape.circle,
                          //   boxShadow: const [
                          //     BoxShadow(color: Colors.grey, spreadRadius: 3),
                          //   ],
                          // ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/icons-new/icon_password.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Lupa Password',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                            fontFamily: "Montserrat",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Masukkan nama pengguna anda, kami akan melakukan verifikasi data anda",
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Color(0xFF120A7C),
                            fontFamily: "Montserrat",
                          ),
                          textAlign: TextAlign.center,
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
                                controller: _usernameController,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                  color: Color(0xFF120A7C),
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Nama Pengguna',
                                  labelStyle: const TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xFF120A7C),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: (state is ForgotPasswordLoadingState)
                                    ? loadingButton()
                                    : verifyButton(context),
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
        ));
  }
}
