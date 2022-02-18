// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/auth/forgot_password/forgot_password_step1_1.dart';
import 'package:wincoremobile/screen/auth/register/register2.dart';

class OTP extends StatefulWidget {
  const OTP({
    Key? key,
    required this.nomorHp,
    required this.verificationId,
    required this.paramMenu,
  }) : super(key: key);

  final String nomorHp;
  final String verificationId;
  final String paramMenu;
  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final _textBoxOTP1Controller = TextEditingController();
  final _textBoxOTP2Controller = TextEditingController();
  final _textBoxOTP3Controller = TextEditingController();
  final _textBoxOTP4Controller = TextEditingController();
  final _textBoxOTP5Controller = TextEditingController();
  final _textBoxOTP6Controller = TextEditingController();

  late String otpNumber;
  final bool first = true;
  final bool last = false;
  late bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF120A7C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
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
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/illustration/illustration-3.png',
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Verifikasi',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Masukan kode OTP yang anda terima.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: TextField(
                                controller: _textBoxOTP1Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: TextField(
                                controller: _textBoxOTP2Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: TextField(
                                controller: _textBoxOTP3Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: TextField(
                                controller: _textBoxOTP4Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: TextField(
                                controller: _textBoxOTP5Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: TextField(
                                controller: _textBoxOTP6Controller,
                                autofocus: true,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                showCursor: false,
                                readOnly: false,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  counter: const Offstage(),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.black12),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            otpNumber = _textBoxOTP1Controller.text +
                                _textBoxOTP2Controller.text +
                                _textBoxOTP3Controller.text +
                                _textBoxOTP4Controller.text +
                                _textBoxOTP5Controller.text +
                                _textBoxOTP6Controller.text;

                            PhoneAuthCredential phoneAuthCredential =
                                PhoneAuthProvider.credential(
                                    verificationId: widget.verificationId,
                                    smsCode: otpNumber);
                            signInWithPhoneAuthCredential(phoneAuthCredential);
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Verifikasi',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                // const Text(
                //   "Didn't you receive any code?",
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white54,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                // const SizedBox(
                //   height: 18,
                // ),
                // const Text(
                //   "Resend New Code",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.blue,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _textFieldOTP({bool first, last}) {
  //   return textBoxOTP(context: context, context: context);
  // }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(
      () {
        isLoading = true;
      },
    );

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      // setState(() {
      //   showLoading = false;
      // });

      if (authCredential.user != null) {
        if (widget.paramMenu == "ForgotPassword") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ForgotPasswordStep1(
                phone_no: widget.nomorHp,
              ),
            ),
          );
        } else if (widget.paramMenu == "Register") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Register2(noHp: widget.nomorHp)));
        }
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      // ignore: avoid_print
      print(e.message);
      // _scaffoldKey.currentState
      //     .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
