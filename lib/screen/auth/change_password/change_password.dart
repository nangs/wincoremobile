import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late String nPhoneNumber,
      nNewPassword,
      nOldPassword,
      nAccountNumber,
      nRePassword;

  final myPhoneNumberController = TextEditingController();
  final myAccountNumberController = TextEditingController();
  final myOldPasswordController = TextEditingController();
  final myNewPasswordController = TextEditingController();
  final myRePasswordController = TextEditingController();

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Ubah Kata Sandi'),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(fontSize: 18.0),
                    controller: myPhoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nomor Telepon',
                    ),
                    onChanged: (text) {
                      nPhoneNumber = text;
                    },
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(fontSize: 18.0),
                    controller: myAccountNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nomor Telepon',
                    ),
                    onChanged: (text) {
                      nAccountNumber = text;
                    },
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(fontSize: 18.0),
                    obscureText: true,
                    controller: myOldPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kata Sandi Lama',
                    ),
                    onChanged: (text) {
                      nOldPassword = text;
                    },
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(fontSize: 18.0),
                    obscureText: true,
                    controller: myNewPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kata Sandi Baru',
                    ),
                    onChanged: (text) {
                      nNewPassword = text;
                    },
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(fontSize: 18.0),
                    obscureText: true,
                    controller: myRePasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ketik Ulang Kata Sandi Baru',
                    ),
                    onChanged: (text) {
                      nRePassword = text;
                    },
                  )),
              const SizedBox(
                height: 25.0,
              ),
              MaterialButton(
                minWidth: 180.0,
                height: 50.0,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  // aksi pindah
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Home(username: ,)));
                },
                child: const Text(
                  'Kirim',
                  style: TextStyle(fontSize: 30.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
