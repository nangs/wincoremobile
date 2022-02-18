// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/helper/alert_message.dart';
import 'package:wincoremobile/helper/modal.dart';
import 'package:wincoremobile/screen/panel/account/account_activities_detail.dart';

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
  @override
  Widget build(BuildContext context) {
    _noRekController.text = widget.no_rek.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mutasi Saldo"),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
          child: Container(
        color: const Color(0xFFF5F3F3),
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 350,
                    child: TextField(
                      style: const TextStyle(
                        // fontSize: 18.0,
                        color: Colors.black87,
                      ),
                      controller: _noRekController,
                      decoration: const InputDecoration(
                        labelText: 'Nomor Rekening',
                        labelStyle: TextStyle(color: Colors.blueAccent),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      readOnly: true,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Periode Transaksi",
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextField(
                              readOnly: true,
                              controller: _startDateController,
                              style: const TextStyle(
                                // fontSize: 18.0,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: 'YYYY / MM / DD',
                                hintStyle:
                                    const TextStyle(color: Colors.black87),
                                suffixIcon: IconButton(
                                  onPressed: _pickStartDateDialog,
                                  color: Colors.black,
                                  icon: const Icon(Icons.date_range),
                                ),
                                labelText: 'Tanggal Mulai',
                                labelStyle:
                                    const TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              readOnly: true,
                              controller: _endDateController,
                              style: const TextStyle(
                                // fontSize: 18.0,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: 'YYYY / MM / DD',
                                hintStyle:
                                    const TextStyle(color: Colors.black87),
                                suffixIcon: IconButton(
                                  onPressed: _pickEndDateDialog,
                                  color: Colors.black,
                                  icon: const Icon(Icons.date_range),
                                ),
                                labelText: 'Tanggal Akhir',
                                labelStyle:
                                    const TextStyle(color: Colors.blueAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Catatan : "),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "* Periode yang dapat dipilih adalah 7 hari.",
                            style: TextStyle(color: Colors.red),
                          ),
                          Text(
                            "* Account Activities maksimum 31 hari yang lalu.",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 200, 15, 15),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_startDateController.text.isNotEmpty &&
                              _endDateController.text.isNotEmpty) {
                            var today = DateTime.now();

                            // if (today.difference(_selectedStartDate).inDays >
                            //         31 ||
                            //     today.difference(_selectedEndDate).inDays >
                            //         31) {
                            //   AlertMessage(
                            //       "Informasi",
                            //       "Mutasi Rekening yang dipilih Maksimal 31 Hari kebelakang",
                            //       "OK",
                            //       context);
                            // } else {
                            // if (_selectedEndDate
                            //         .difference(_selectedStartDate)
                            //         .inDays >
                            //     7) {
                            //   AlertMessage(
                            //       "Informasi",
                            //       "Mutasi Rekening yang ditampilkan Maksimal 7 hari",
                            //       "OK",
                            //       context);
                            // } else {
                            M_PIN_AccActivitiesModalDialog(
                                context,
                                widget.username,
                                widget.userid,
                                widget.no_rek,
                                _startDateController.text,
                                _endDateController.text,
                                "1");
                            // }
                            // }
                          } else {
                            AlertMessage(
                                "Informasi",
                                "Mohon periksa kembali tanggal mulai dan tanggal akhir",
                                "OK",
                                context);
                          }
                        },
                        child: const Text("Kirim"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
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
