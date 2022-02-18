import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/auth/register/register.dart';
import 'package:wincoremobile/screen/auth/sign_in/sign_in.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xff120A7C),

      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                width: double.infinity,
              ),
              const Text(
                "Selamat Datang,",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Mulai hari mu dengan WINCore Mobile !",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Image.asset(
                'assets/images/WINCore copy.png',
                width: double.infinity,
              ),
              const SizedBox(
                height: 180,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Register(),
                    ));
                  },
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)))),
                  child: const Padding(
                    padding: EdgeInsets.all(14),
                    child: Text("Buat Akun Baru"),
                  ),
                ),
              ),
              SizedBox(
                  height: 24,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Atau",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ));
                  },
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade300),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)))),
                  child: const Padding(
                    padding: EdgeInsets.all(14),
                    child: Text("Masuk"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
