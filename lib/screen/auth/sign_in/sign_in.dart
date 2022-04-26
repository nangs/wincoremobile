// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wincoremobile/application/auth/auth_cubit.dart';
import 'package:wincoremobile/domain/model/auth/auth_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/auth/forgot_password/forgot_password_step1.dart';
import 'package:wincoremobile/screen/auth/register/register.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 35, horizontal: 32),
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
                          var username =
                              state.dataLogin.info?.accountName.toString();
                          var noRek =
                              state.dataLogin.info?.accountList?[0].toString();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Home(
                                userid: _userController.text,
                                username: username.toString(),
                                no_rek: noRek.toString(),
                                cust_no:
                                    state.dataLogin.info!.custNo.toString(),
                                lastLogin:
                                    state.dataLogin.info!.lastLogin.toString(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                          'assets/images/WINCore copy.png'),
                                      height: 80,
                                      width: 300,
                                      // margin: EdgeInsets.symmetric(vertical: 30),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "SIGN IN",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  //keyboardType: TextInputType.text,
                                  controller: _userController,
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.blue.shade900,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Colors.blue.shade900,
                                      //fontSize: 10
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(13.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  //keyboardType: TextInputType.text,
                                  controller: _passwordController,
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.blue.shade900,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.blue.shade900),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black87,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  obscureText: _isObscure,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              "Forgot Password ?",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
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
                                          "or",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Colors.white),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don't have an account? ",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Colors.white,
                                            ),
                                          ),
                                          InkWell(
                                            child: Text(
                                              "Register Here",
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
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
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 160,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 50),
                                  child: (state is AuthLoading)
                                      ? _flatLoadingButton()
                                      : _flatLoginButton(context),
                                ),
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
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
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
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
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
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
    );
  }
}
