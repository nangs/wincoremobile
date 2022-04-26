// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void alertLoginError(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Informasi",
      style: TextStyle(
        fontFamily: "Montserrat",
      ),
    ),
    content: Container(
      child: const Text(
        "Username atau Password salah",
        style: TextStyle(
          fontFamily: "Montserrat",
        ),
      ),
    ),
    actions: [
      TextButton(
        child: const Text(
          "OK",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        onPressed: () =>
            Navigator.of(context, rootNavigator: true).pop(context),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (context) => alert,
    useRootNavigator: true,
    useSafeArea: true,
  );
}

void AlertMessage(
    String Title, String Message, String ButtonMessage, BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text(
      Title,
      style: const TextStyle(
        fontFamily: "Montserrat",
      ),
    ),
    content: Container(
      child: Text(
        Message,
        style: const TextStyle(
          fontFamily: "Montserrat",
        ),
      ),
    ),
    actions: [
      TextButton(
        child: Text(
          ButtonMessage,
          style: const TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        onPressed: () =>
            Navigator.of(context, rootNavigator: true).pop(context),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (context) => alert,
    useRootNavigator: true,
    useSafeArea: true,
  );
}
