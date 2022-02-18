// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/application/register/cubit/register_cubit.dart';
import 'package:wincoremobile/domain/model/register/register_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/auth/sign_in/sign_in.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/src/provider.dart';
// import 'package:wincoremobile/model/register/cubit/register_cubit.dart';
// import 'package:wincoremobile/widget/otp.dart';

enum ValidationPasswordState {
  notset,
  samePasswordWithConfirm,
  diffPasswordWithConfirm,
}
enum ValidationMPINState {
  notset,
  sameMPINWithConfirm,
  diffMPINWithConfirm,
}

class Register2 extends StatefulWidget {
  const Register2({Key? key, required this.noHp}) : super(key: key);

  final String noHp;
  @override
  State<Register2> createState() => _Register2State();
}

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class _Register2State extends State<Register2> {
  final _dobController = TextEditingController();
  final _noKtpController = TextEditingController();
  final _noRekController = TextEditingController();
  final _userIdController = TextEditingController();
  final _passController = TextEditingController();
  final _passConfController = TextEditingController();
  final _mpinController = TextEditingController();
  final _mpinConfController = TextEditingController();

  late String verificationId;

  bool showLoading = false;

  ValidationPasswordState currentPasswordState = ValidationPasswordState.notset;
  ValidationMPINState currentMPINState = ValidationMPINState.notset;

  ElevatedButton registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // var phoneNumber = int.tryParse(_mobileNumberController.text);
        // if ((phoneNumber is int) == true) {
        var birthday = _dobController.text.replaceAll('/', '');
        final _request = RegisterRequest(
          accountno: _noRekController.text,
          identityno: _noKtpController.text,
          // birthdate: int.parse(birthday),
          birthdate: birthday,
          username: _userIdController.text,
          password: _passController.text,
          mpin: _mpinController.text,
          phonenum: widget.noHp.toString(),
        );

        context.read<RegisterCubit>().registeringNewUser(_request);
        // }
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
        child: Text(
          'Kirim',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  ElevatedButton loadingOTPButton() {
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

  ElevatedButton disabledButton() {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      child: const Padding(padding: EdgeInsets.all(14.0), child: Text("Kirim")),
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
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterErrorState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(state.errorMsg),
                ),
              );
            } else if (state is RegisterLoadingState) {
              print("register is loading now");
            } else if (state is RegisterSuccessState) {
              if (state.dataLogin.status == "REGISTER_OK") {
                var accname = state.dataLogin.info?.accountName.toString();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: Text("Hi, " + accname.toString()),
                      content: const Text("Registrasi akun anda berhasil !"),
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
              } else if (state.dataLogin.status == "REGISTER_ACCOUNTNO_EXIST") {
                AlertMessage(
                    "Informasi",
                    "Nomor Rekening anda sudah terdaftar, hubungi Customer Service 12345 untuk info lebih lanjut",
                    "OK",
                    context);
              } else if (state.dataLogin.status == "REGISTER_USERNAME_EXIST") {
                AlertMessage(
                    "Informasi", "Username telah digunakan", "OK", context);
              } else if (state.dataLogin.status == "INVALID_ACCOUNT_NO") {
                AlertMessage("Informasi",
                    "Nomor Rekening yang anda masukan salah", "OK", context);
              } else if (state.dataLogin.status == "VERIFICATION_FAILED") {
                AlertMessage(
                    "Informasi", "Data tidak terdaftar", "OK", context);
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
                      const Text(
                        "Masukan data pribadi anda",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextField(
                        controller: _dobController,
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'YYYY / MM / DD',
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          suffixIcon: IconButton(
                            onPressed: _pickDateDialog,
                            color: Colors.white,
                            icon: const Icon(Icons.date_range),
                          ),
                          labelText: 'Tanggal Lahir',
                          labelStyle: const TextStyle(color: Colors.blueAccent),
                        ),
                        readOnly: true,
                      ),
                      TextField(
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        controller: _noKtpController,
                        decoration: const InputDecoration(
                          labelText: 'Nomor Identitas',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                      ),
                      TextField(
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        controller: _noRekController,
                        decoration: const InputDecoration(
                          labelText: 'Nomor Rekening',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                      ),
                      TextField(
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        controller: _userIdController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Pengguna',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                      ),
                      TextField(
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        controller: _passController,
                        decoration: const InputDecoration(
                          labelText: 'Kata Sandi',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                      ),
                      TextField(
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        controller: _passConfController,
                        decoration: const InputDecoration(
                          labelText: 'Ketikan Ulang Kata Sandi',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onChanged: (context) {
                          if (_passController.text !=
                              _passConfController.text) {
                            setState(() {
                              currentPasswordState = ValidationPasswordState
                                  .diffPasswordWithConfirm;
                            });
                          } else {
                            setState(() {
                              currentPasswordState = ValidationPasswordState
                                  .samePasswordWithConfirm;
                            });
                          }
                        },
                      ),
                      TextField(
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        controller: _mpinController,
                        decoration: const InputDecoration(
                          labelText: 'M-PIN',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                      ),
                      TextField(
                        style: const TextStyle(
                          // fontSize: 18.0,
                          color: Colors.white,
                        ),
                        controller: _mpinConfController,
                        decoration: const InputDecoration(
                          labelText: 'Ketikan Ulang M-PIN',
                          labelStyle: TextStyle(color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                        onChanged: (context) {
                          if (_mpinController.text !=
                              _mpinConfController.text) {
                            setState(() {
                              currentMPINState =
                                  ValidationMPINState.diffMPINWithConfirm;
                            });
                          } else {
                            setState(() {
                              currentMPINState =
                                  ValidationMPINState.sameMPINWithConfirm;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: (currentPasswordState ==
                                    ValidationPasswordState
                                        .samePasswordWithConfirm &&
                                currentMPINState ==
                                    ValidationMPINState.sameMPINWithConfirm)
                            ? registerButton(context)
                            : disabledButton(),
                        // child: registerButton(context),
                      )
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
}
