// ignore_for_file: must_be_immutable, prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/application/forgotMPIN/cubit/forgot_m_pin_cubit.dart';
import 'package:wincoremobile/domain/model/forgotMPin/forgotMPin_request.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

class ForgotMPin extends StatefulWidget {
  ForgotMPin({
    Key? key,
    required this.noRek,
    required this.username,
    required this.userid,
  }) : super(key: key);

  String noRek;
  String username;
  String userid;
  @override
  _ForgotMPinState createState() => _ForgotMPinState();
}

class _ForgotMPinState extends State<ForgotMPin> {
  final _dobController = TextEditingController();
  final _noKTPController = TextEditingController();
  final _MPINController = TextEditingController();
  final _RetypeMPINController = TextEditingController();

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
        final forgotMPinRequest = ForgotMPinRequest(
          accountno: widget.noRek,
          username: widget.userid,
          identityno: _noKTPController.text,
          birthdate: _dobController.text.replaceAll("/", ""),
          newpin: _MPINController.text,
        );

        context.read<ForgotMPinCubit>().forgotMPinVerifyData(forgotMPinRequest);
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
      child: const Padding(padding: EdgeInsets.all(14.0), child: Text("Kirim")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120A7C),
      body: BlocProvider(
        create: (context) => ForgotMPinCubit(),
        child: BlocConsumer<ForgotMPinCubit, ForgotMPinState>(
          listener: (context, state) {
            if (state is ForgotMPinLoadingState) {
              print("Now is loading");
            } else if (state is ForgotMPinErrorState) {
              print(state.errorMsg);
            } else if (state is ForgotMPinSuccessRestoreState) {
              print(state.forgotMPinResponse);
              if (state.forgotMPinResponse.status == "CHANGE_OK") {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: const Text("Informasi"),
                      content: const Text("M-PIN kamu berhasil diperbarui !"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Home(
                                  no_rek: widget.noRek,
                                  username: widget.username,
                                  userid: widget.userid,
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
                      title: const Text("Informasi"),
                      content:
                          const Text("Data yang kamu masukkan tidak valid."),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Home(
                                  no_rek: widget.noRek,
                                  username: widget.username,
                                  userid: widget.userid,
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
                              'assets/images/illustration/illustration-6.png',
                            )),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Lupa M-PIN',
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
                              controller: _noKTPController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Nomor Identitas',
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
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
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              readOnly: true,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _MPINController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              decoration: InputDecoration(
                                labelText: 'M-PIN Baru',
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value != _RetypeMPINController.text) {
                                  return 'M-PIN tidak sama dengan yang diketikan ulang';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _RetypeMPINController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              decoration: InputDecoration(
                                labelText: 'Ketik Ulang M-PIN Baru',
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value != _MPINController.text) {
                                  return 'M-PIN tidak sama dengan yang diketikan ulang';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: (state is ForgotMPinLoadingState)
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
      ),
    );
  }
}
