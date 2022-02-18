// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void alertLoginError(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text("Informasi"),
    content: Container(
      child: const Text("Username atau Password salah"),
    ),
    actions: [
      TextButton(
        child: const Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );

  showDialog(context: context, builder: (context) => alert);
}

void AlertMessage(
    String Title, String Message, String ButtonMessage, BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text(Title),
    content: Container(
      child: Text(Message),
    ),
    actions: [
      TextButton(
        child: Text(ButtonMessage),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );

  showDialog(context: context, builder: (context) => alert);
}
