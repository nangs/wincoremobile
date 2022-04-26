// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/helper/modal.dart';

class AccountActivities extends StatefulWidget {
  AccountActivities(
      {Key? key,
      required this.no_rek,
      required this.userid,
      required this.username})
      : super(key: key);

  String username;
  String userid;
  String no_rek;
  @override
  State<AccountActivities> createState() => _AccountActivitiesState();
}

class _AccountActivitiesState extends State<AccountActivities> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _noRekController = TextEditingController();

  late DateTime _selectedStartDate = DateTime.now();
  late DateTime _selectedEndDate = DateTime.now();

  late String selectedTransaksi = 'Semua Transaksi';
  List<String> jnsTransaksi = <String>[
    'Semua Transaksi',
    'Uang Masuk',
    'Uang Keluar'
  ];
  @override
  Widget build(BuildContext context) {
    _noRekController.text = widget.no_rek.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "",
        ),
        backgroundColor: const Color(0xff120A7C),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 1,
                    ),
                    const Text(
                      'Mutasi Rekening',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Nomor Rekening",
                                style: TextStyle(
                                  color: Colors.lightBlue[900],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextField(
                            readOnly: true,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              //color: Colors.blueAccent[600],
                              fontFamily: "Montserrat",
                            ),
                            controller: _noRekController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.lightBlue,
                              ),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Periode Transaksi",
                                style: TextStyle(
                                  color: Colors.lightBlue[900],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextField(
                            readOnly: true,
                            controller: _startDateController,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                            ),
                            decoration: InputDecoration(
                              hintText: 'YYYY / MM / DD',
                              hintStyle: const TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: "Montserrat",
                              ),
                              suffixIcon: IconButton(
                                onPressed: _pickStartDateDialog,
                                color: Colors.blue,
                                icon: const Icon(Icons.date_range),
                              ),
                              labelText: 'Tanggal Mulai',
                              labelStyle: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.lightBlue[600],
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(8)),
                              isDense: true, // Added this
                              contentPadding:
                                  const EdgeInsets.all(8), // Added this
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextField(
                            readOnly: true,
                            controller: _endDateController,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat",
                            ),
                            decoration: InputDecoration(
                              hintText: 'YYYY / MM / DD',
                              hintStyle: const TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: "Montserrat",
                              ),
                              suffixIcon: IconButton(
                                onPressed: _pickEndDateDialog,
                                color: Colors.blue,
                                icon: const Icon(Icons.date_range),
                              ),
                              labelText: 'Tanggal Akhir',
                              labelStyle: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.lightBlue[600],
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(8)),
                              isDense: true, // Added this
                              contentPadding:
                                  const EdgeInsets.all(8), // Added this
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Catatan : ",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "* Periode yang dapat dipilih adalah 7 hari.",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "* Account Activities maksimum 31 hari yang lalu.",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 160, 60, 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(17.0),
                            child: Text(
                              "Kirim",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_startDateController.text.isNotEmpty &&
                                _endDateController.text.isNotEmpty) {
                              M_PIN_AccActivitiesModalDialog(
                                  context,
                                  widget.username,
                                  widget.userid,
                                  widget.no_rek,
                                  _startDateController.text,
                                  _endDateController.text,
                                  "1");
                            } else {
                              AlertMessage(
                                  "Informasi",
                                  "Mohon periksa kembali tanggal mulai dan tanggal akhir",
                                  "OK",
                                  context);
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade900),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                            ),
                          ),
                          //child: const Text("Kirim"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> _pickStartDateDialog() {
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
              _selectedStartDate = pickedDate;
            },
          );

          _startDateController.text =
              DateFormat("yyyy/MM/dd").format(_selectedStartDate);
          return pickedDate.toString();
        }
      },
    );
  }

  Future<String?> _pickEndDateDialog() {
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
              _selectedEndDate = pickedDate;
            },
          );

          _endDateController.text =
              DateFormat("yyyy/MM/dd").format(_selectedEndDate);
          return pickedDate.toString();
        }
      },
    );
  }
}
