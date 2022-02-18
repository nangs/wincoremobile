// ignore_for_file: avoid_print, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/application/forgotPassword/cubit/forgot_password_cubit.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_request.dart';
import 'package:wincoremobile/screen/auth/forgot_password/forgot_password_step2.dart';
import 'package:wincoremobile/screen/auth/sign_in/sign_in.dart';

class ForgotPasswordVerification extends StatefulWidget {
  ForgotPasswordVerification(
      {Key? key, required this.username, required this.phone_no})
      : super(key: key);
  String username;
  String phone_no;
  @override
  _ForgotPasswordVerificationState createState() =>
      _ForgotPasswordVerificationState();
}

class _ForgotPasswordVerificationState
    extends State<ForgotPasswordVerification> {
  final _dobController = TextEditingController();
  final _noKtpController = TextEditingController();
  final _noRekController = TextEditingController();

  ElevatedButton loadingButton() {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
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
        final forgotPasswordVerificationRequest =
            ForgotPasswordVerificationDataRequest(
          username: widget.username,
          phonenum: widget.phone_no,
          accountno: _noRekController.text,
          birthdate: _dobController.text.replaceAll("/", ""),
          identityno: _noKtpController.text,
          procedure: "VERIFY",
        );

        context
            .read<ForgotPasswordCubit>()
            .forgotPasswordVerifyData(forgotPasswordVerificationRequest);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(14.0),
        child: Text("Verifikasi Data"),
      ),
    );
  }

  late DateTime _selectedDate = DateTime.now();

  //Method for showing the date picker
  Future<String?> _pickDateDialog() {
    return showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1900),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then(
      (pickedDate) {
        //then usually do the future job
        if (pickedDate == null) {
          //if user tap cancel then this function will stop
          return null;
        } else {
          setState(
            () {
              //for rebuilding the ui
              _selectedDate = pickedDate;
            },
          );

          _dobController.text = DateFormat("yyyy/MM/dd").format(_selectedDate);
          return pickedDate.toString();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF120A7C),
        body: BlocProvider(
          create: (context) => ForgotPasswordCubit(),
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordErrorState) {
                print(state.errorMsg);
              } else if (state is ForgotPasswordLoadingState) {
                print("Now is Loading");
              } else if (state is ForgotPasswordVerifySuccessState) {
                print(state.forgotPasswordResponse);
                if (state.forgotPasswordResponse.status == "VERIFICATION_OK") {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordStep2(
                        phoneNo: widget.phone_no,
                        username: widget.username,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: const Text("Informasi"),
                        content: const Text("Data Nasabah Tidak Ditemukan."),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('OK'),
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
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 3),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/illustration/illustration-5.png',
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
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Masukkan data personal anda, kami akan melakukan verifikasi data anda",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
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
                                controller: _noRekController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Nomor Rekening',
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
                                height: 8,
                              ),
                              TextField(
                                controller: _dobController,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'YYYY / MM / DD',
                                  hintStyle:
                                      const TextStyle(color: Colors.blueGrey),
                                  suffixIcon: IconButton(
                                    onPressed: _pickDateDialog,
                                    color: Colors.blue,
                                    icon: const Icon(Icons.date_range),
                                  ),
                                  labelText: 'Tanggal Lahir',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                // keyboardType: TextInputType.datetime,
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.singleLineFormatter
                                // ],
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: _noKtpController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Nomor Identitas',
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
                                height: 8,
                              ),
                              SizedBox(
                                width: double.infinity,
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
