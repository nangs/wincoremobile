import 'package:flutter/material.dart';

class TransferBalance extends StatefulWidget {
  const TransferBalance({Key? key}) : super(key: key);

  @override
  State<TransferBalance> createState() => _TransferBalanceState();
}

class _TransferBalanceState extends State<TransferBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kirim Saldo"),
        backgroundColor: const Color(0xff120A7C),
      ),
    );
  }
}
