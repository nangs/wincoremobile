// ignore_for_file: avoid_print, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:wincoremobile/screen/panel/home/home.dart';
import 'package:wincoremobile/helper/otp.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/src/provider.dart';
// import 'package:wincoremobile/model/register/cubit/register_cubit.dart';
// import 'package:wincoremobile/widget/otp.dart';

enum MobileVerificationState {
  inputPhoneNumberSTATE,
  sendOTPSTATE,
  showOTPFormState,
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => OTP(
                    nomorHp: '+62' + _mobileNumberController.text,
                    verificationId: verificationId,
                    paramMenu: "Register",
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(14),
        child: Text(
          'Kirim',
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16,
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(14.0),
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF120A7C),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.of(context).pop(context);
        },
        backgroundColor: const Color(0xFF120A7C),
        child: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                children: [
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple.shade50,
                    //   shape: BoxShape.circle,
                    // ),
                    child: Image.asset(
                      'assets/images/icons-new/icon_pendaftaran-05.png',
                    ),
                  ),
                  // const SizedBox(
                  //   height: 24,
                  // ),
                  const Text(
                    'Pendaftaran',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Tambahkan nomor telepon Anda. Kami akan mengirimkan kode verifikasi agar kami tahu bahwa Anda asli.",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      // fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _mobileNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Nomor Telepon',
                            labelStyle: const TextStyle(
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
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: currentState ==
                                  MobileVerificationState.sendOTPSTATE
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
      ),
    );
  }
}
