// ignore_for_file: avoid_print, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:wincoremobile/screen/panel/home/home.dart';
import 'package:wincoremobile/helper/otp.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/src/provider.dart';
// import 'package:wincoremobile/model/ForgotPassword/cubit/ForgotPassword_cubit.dart';
// import 'package:wincoremobile/widget/otp.dart';

enum MobileVerificationState {
  inputPhoneNumberSTATE,
  sendOTPSTATE,
  showOTPFormState,
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _mobileNumberController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  MobileVerificationState currentState =
      MobileVerificationState.inputPhoneNumberSTATE;
  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      // ignore: unused_local_variable
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      print(e.message);
    }
  }

  ElevatedButton requestOTPButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var phoneNumber = int.tryParse(_mobileNumberController.text);
        if ((phoneNumber is int) == true) {
          setState(() {
            showLoading = true;
            currentState = MobileVerificationState.sendOTPSTATE;
          });

          await _auth.verifyPhoneNumber(
            phoneNumber: '+62' + _mobileNumberController.text,
            verificationCompleted: (phoneAuthCredential) async {
              setState(() {
                showLoading = false;
              });
              //signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            verificationFailed: (verificationFailed) async {
              setState(() {
                showLoading = false;
              });
              print(verificationFailed.message);
            },
            codeSent: (verificationId, resendingToken) async {
              setState(() {
                showLoading = false;
                currentState = MobileVerificationState.showOTPFormState;
                this.verificationId = verificationId;
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OTP(
                    nomorHp: '+62' + _mobileNumberController.text,
                    verificationId: verificationId,
                    paramMenu: "ForgotPassword",
                  ),
                ),
              );
            },
            codeAutoRetrievalTimeout: (verificationId) async {
              currentState = MobileVerificationState.inputPhoneNumberSTATE;
            },
          );
        }
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
          'Kirim',
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  ElevatedButton loadingOTPButton() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
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
                  // color: Colors.deepPurple.shade50,
                  // shape: BoxShape.circle,
                  //   boxShadow: const [
                  //     BoxShadow(color: Colors.grey, spreadRadius: 3),
                  //   ],
                  // ),
                  // child: Image.asset(
                  //   'assets/images/illustration/illustration-4.png',
                  // ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/icons-new/icon_password.png',
                      )),
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
                  "Tambahkan nomor telepon Anda.\nKami akan mengirimkan kode verifikasi agar kami tahu bahwa Anda asli.",
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
                        controller: _mobileNumberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                          color: Color(0xFF120A7C),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Nomor Telepon',
                          labelStyle: const TextStyle(
                            color: Color(0xFF120A7C),
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
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '(+62)',
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                                color: Color(0xFF120A7C),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child:
                            currentState == MobileVerificationState.sendOTPSTATE
                                ? loadingOTPButton()
                                : requestOTPButton(context),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
