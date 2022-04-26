// ignore_for_file: must_be_immutable, prefer_final_fields, avoid_print

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wincoremobile/application/transactions/pindahbuku/cubit/konfirmasi_pindah_buku_cubit.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_request.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/screen/transactions/qris/qris_transfer_balance.dart';

class QRIS extends StatefulWidget {
  QRIS({
    Key? key,
    required this.accountNo,
    required this.username,
    required this.userid,
    required this.custNo,
    required this.lastLogin,
  }) : super(key: key);

  String accountNo;
  String username;
  String userid;
  String custNo;
  String lastLogin;

  @override
  State<QRIS> createState() => _QRISState();
}

class _QRISState extends State<QRIS> {
  ScanResult? scanResult;

  var _aspectTolerance = 0.00;
  // ignore: unused_field
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;
  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show QR"),
        backgroundColor: const Color(0xff120A7C),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // color: Colors.grey[300],
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: BlocProvider(
              create: (context) => KonfirmasiPindahBukuCubit(),
              child: BlocConsumer<KonfirmasiPindahBukuCubit,
                  KonfirmasiPindahBukuState>(
                listener: (context, state) {
                  if (state is KonfirmasiPindahBukuLoading) {
                    print("Now is loading..");
                  } else if (state is KonfirmasiPindahBukuError) {
                    print(state.errorMsg);
                  } else if (state is KonfirmasiPindahBukuSuccess) {
                    if (state.response.status == "OK") {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QrisTransferBalance(
                            response: state.response,
                            noRek: widget.accountNo,
                            username: widget.username,
                            userid: widget.userid,
                            cust_no: widget.custNo,
                            lastLogin: widget.lastLogin,
                          ),
                        ),
                      );
                    } else {
                      AlertMessage(
                          "Informasi",
                          "Terjadi kesalahan, mohon hubungi administrator.",
                          "OK",
                          context);
                    }
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Nomor Rekening : ",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                widget.accountNo,
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Text(
                                widget.username.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Center(
                                child: QrImage(
                                  data: widget.accountNo,
                                  version: QrVersions.auto,
                                  size: MediaQuery.of(context).size.width / 1.5,
                                  padding: const EdgeInsets.all(8),
                                  embeddedImage: const AssetImage(
                                      'assets/images/wbk-small.jpeg'),
                                  embeddedImageStyle: QrEmbeddedImageStyle(
                                      size: const Size(28, 28)),
                                ),
                              ),
                              Text(
                                widget.accountNo,
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Color(0xff120A7C),
                                  letterSpacing: 1.5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 6),
                        width: MediaQuery.of(context).size.height / 2.5,
                        child: (state is KonfirmasiPindahBukuLoading)
                            ? _flatLoadingButton()
                            : ElevatedButton(
                                onPressed: () async {
                                  await _scan();

                                  final request = TransferConfirmationPBRequest(
                                    accountno:
                                        scanResult!.rawContent.toString(),
                                  );

                                  context
                                      .read<KonfirmasiPindahBukuCubit>()
                                      .getAccountName(request);
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff120A7C)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text(
                                    "Scan QR",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _flatLoadingButton() {
    return ElevatedButton(
      onPressed: null,
      child: const Padding(
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

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );

      setState(() {
        scanResult = result;
        // _transferToController.text = result.rawContent.toString();
      });
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }
}
