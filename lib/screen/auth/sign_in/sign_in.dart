// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/auth/auth_cubit.dart';
import 'package:wincoremobile/domain/model/auth/auth_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/auth/forgot_password/forgot_password_step1.dart';
import 'package:wincoremobile/screen/auth/register/register.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isObscure = true;

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff120A7C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 32),
          child: BlocProvider(
            create: (context) => AuthCubit(),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  print(state.errorMsg);
                } else if (state is AuthLoading) {
                  print("Now is Loading");
                } else if (state is AuthLoginSuccess) {
                  print(state.dataLogin);
                  if (state.dataLogin.status == "LOGIN_OK") {
                    var username = state.dataLogin.info?.accountName.toString();
                    var noRek =
                        state.dataLogin.info?.accountList?[0].toString();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Home(
                          userid: _userController.text,
                          username: username.toString(),
                          no_rek: noRek.toString(),
                        ),
                      ),
                    );
                  } else {
                    alertLoginError(context);
                  }
                }
              },
              builder: (context, state) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Container(
                      alignment: Alignment.topCenter,
                      // margin: EdgeInsets.symmetric(horizontal: 50),
                      // color: Color(0xffffffff),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                child: Image.asset(
                                    'assets/images/WINCore copy.png'),
                                // width: 200,
                                // margin: EdgeInsets.symmetric(vertical: 30),
                              ),
                              SizedBox(
                                height: 75,
                              ),
                              Text(
                                "SIGN IN",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[50],
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _userController,
                            decoration: InputDecoration(
                              // border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                              hintText: "Username",
                              // iconColor: Colors.white,
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(
                              color: Colors.amber[50],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              // border: UnderlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.lock_open,
                                color: Colors.white,
                              ),
                              hintText: "Password",
                              // iconColor: Colors.white,
                              hintStyle: TextStyle(
                                color: Colors.amber[50],
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.amber[50],
                            ),
                            obscureText: _isObscure,
                            enableSuggestions: false,
                            autocorrect: false,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(top: 10),
                            child: (state is AuthLoading)
                                ? _flatLoadingButton()
                                : _flatLoginButton(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 75),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Text(
                                        "Forgot Password ?",
                                        style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              color: Colors.blue[300]),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPassword()));

                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => Register()));
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          color: Colors.amber[50],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Text(
                                        "Register Here",
                                        style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                              color: Colors.blue[300]),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Register()));

                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => Register()));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _flatLoginButton(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Text(
          "LOGIN",
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () async {
        final authRequest = AuthRequest(
          username: _userController.text,
          password: _passwordController.text,
        );

        context.read<AuthCubit>().signInUser(authRequest);

        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => Home()));
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
    );
  }

  ElevatedButton _flatLoadingButton() {
    return ElevatedButton(
      onPressed: null,
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
