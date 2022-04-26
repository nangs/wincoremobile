// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, sized_box_for_whitespace, non_constant_identifier_names, unnecessary_new, prefer_const_constructors

// import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/helper/modal.dart';
import 'package:wincoremobile/screen/panel/account/account_activities/account_activities.dart';
import 'package:wincoremobile/screen/panel/contact_us/contact_us.dart';
import 'package:wincoremobile/screen/panel/notification/notifications.dart';
import 'package:wincoremobile/screen/panel/settings/about.dart';
import 'package:wincoremobile/screen/panel/settings/faq.dart';
import 'package:wincoremobile/screen/panel/settings/settings.dart';
import 'package:wincoremobile/screen/transactions/pindah_buku/transfer_balance2.dart';
import 'package:wincoremobile/screen/transactions/qris/qris.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
    required this.username,
    required this.no_rek,
    required this.userid,
    required this.cust_no,
    required this.lastLogin,
  }) : super(key: key);
  String username;
  String no_rek;
  String userid;
  String cust_no;
  String lastLogin;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _formatDateTime2(DateTime dateTime) {
    return DateFormat('dd MMM yyyy - hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var tempLastLogin = widget.lastLogin.split(".");
    DateTime lastLogin = new DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(tempLastLogin[0].toString());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          label: Text("QRku"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QRIS(
                  accountNo: widget.no_rek,
                  username: widget.username,
                  userid: widget.userid,
                  custNo: widget.cust_no,
                  lastLogin: widget.lastLogin,
                ),
              ),
            );
          },
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.qr_code_scanner_outlined),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xff120A7C),
          title: const Text(
            "WINCore Mobile",
            style: TextStyle(fontFamily: "Montserrat", color: Colors.white),
          ),
          centerTitle: true,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Notifications()));
              },
              child: const Icon(Icons.notifications),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade300),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff120A7C),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'WINCore Mobile',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.cust_no,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.envelope,
                  color: Color(0xff120A7C),
                ),
                title: Text('Inbox',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    )),
                onTap: () => {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => Settings(
                  //       noRek: widget.no_rek,
                  //       username: widget.username,
                  //       userid: widget.userid,
                  //       cust_no: widget.cust_no,
                  //       last_login: widget.lastLogin,
                  //     ),
                  //   ),
                  // ),
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.qr_code,
                  color: Color(0xff120A7C),
                ),
                title: Text("QRku",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    )),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QRIS(
                        accountNo: widget.no_rek,
                        username: widget.username,
                        userid: widget.userid,
                        custNo: widget.cust_no,
                        lastLogin: widget.lastLogin,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.clipboardQuestion,
                  color: Color(0xff120A7C),
                ),
                title: Text('FAQ',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    )),
                onTap: () => {
                  // Navigator.pop(context),
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FAQ(),
                  ))
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.message,
                  color: Color(0xff120A7C),
                ),
                title: Text('About',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    )),
                onTap: () => {
                  // Navigator.pop(context),
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const About(),
                  ))
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Color(0xff120A7C),
                ),
                title: Text('Settings',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    )),
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Settings(
                        noRek: widget.no_rek,
                        username: widget.username,
                        userid: widget.userid,
                        cust_no: widget.cust_no,
                        last_login: widget.lastLogin,
                      ),
                    ),
                  ),
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app_sharp,
                  color: Color(0xff120A7C),
                ),
                title: Text("Logout",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                    )),
                onTap: () => {
                  showLogoutAlertDialog(context),
                },
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3F3),
                image: DecorationImage(
                  image: AssetImage("assets/images/background2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            // horizontal: 10,
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 40),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                aspectRatio: 3,
                              ),
                              items: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/WINCore.jpeg',
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/wincore_cooperation.png',
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/wincore_microbanking.png',
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/wincore_syariah.png',
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/product_mcore.png',
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 50, 40, 5),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hai, ${widget.username.toUpperCase()}",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff120A7C),
                                ),
                              ),
                              Text(
                                "Last Login : " + _formatDateTime2(lastLogin),
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 11,
                                  color: Color(0xff120A7C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    M_PIN_AccInfoModalDialog(
                                        context,
                                        widget.username,
                                        widget.userid,
                                        widget.no_rek);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/icons-new/menuicon_info_rekening.png',
                                        width: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Informasi Rekening",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AccountActivities(
                                          username: widget.username,
                                          userid: widget.userid,
                                          no_rek: widget.no_rek,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/icons-new/menuicon_mutasi_rekening.png',
                                        width: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Mutasi Rekening",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    M_PIN_DepositoModalDialog(
                                        context,
                                        widget.username,
                                        widget.userid,
                                        widget.no_rek,
                                        widget.cust_no,
                                        "1");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/icons-new/menuicon_info_deposito.png',
                                        width: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Informasi Deposito",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => TransferBalance2(
                                          noRek: widget.no_rek,
                                          username: widget.username,
                                          userid: widget.userid,
                                          cust_no: widget.cust_no,
                                          lastLogin: widget.lastLogin,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/icons-new/menuicon_transfer.png',
                                        width: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Transfer Saldo (PB)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     width: 100,
                          //     height: 100,
                          //     child: Card(
                          //       elevation: 0.2,
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(8.0)),
                          //       child: InkWell(
                          //         onTap: () {
                          //           // Navigator.of(context).push(MaterialPageRoute(
                          //           //     builder: (context) =>
                          //           //         const TransferBalance()));
                          //         },
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.center,
                          //           children: <Widget>[
                          //             Image.asset(
                          //               'assets/images/icons-new/menuicon_multi_transfer.png',
                          //               width: 40,
                          //             ),
                          //             const SizedBox(height: 8),
                          //             const Text(
                          //               "Multi Transfer",
                          //               textAlign: TextAlign.center,
                          //               style: TextStyle(fontFamily:"Montserrat",
                          //                   fontSize: 10,
                          //                   color: Colors.black87),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    M_PIN_PortfolioModalDialog(
                                        context,
                                        widget.username,
                                        widget.userid,
                                        widget.no_rek,
                                        widget.cust_no,
                                        "1");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/icons-new/menuicon_portfolio.png',
                                        width: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Portfolio",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    M_PIN_PinjamanModalDialog(
                                        context,
                                        widget.username,
                                        widget.userid,
                                        widget.no_rek,
                                        widget.cust_no,
                                        "1");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/icons-new/menuicon_pinjaman.png',
                                        width: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Pinjaman",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Container(
                          //     width: 100,
                          //     height: 100,
                          //     child: Card(
                          //       elevation: 0.2,
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(8.0)),
                          //       child: InkWell(
                          //         onTap: () {
                          //           modalBottomSheetPembayaran(context);
                          //         },
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.center,
                          //           children: <Widget>[
                          //             Image.asset(
                          //               'assets/images/icons-new/menuicon_pembayaran.png',
                          //               width: 40,
                          //             ),
                          //             const SizedBox(height: 8),
                          //             const Text(
                          //               "Pembayaran",
                          //               textAlign: TextAlign.center,
                          //               style: TextStyle(fontFamily:"Montserrat",
                          //                   fontSize: 10,
                          //                   color: Colors.black87),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              child: Card(
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ContactUs(
                                          noRek: widget.no_rek,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/icons-new/menuicon_ask.png',
                                        width: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Ask Bank Demo",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 10,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showLogoutAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: const Text("Logout"),
      onPressed: () {
        SystemNavigator.pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: none,
      content: const Text("Anda akan logout dari WINCore Mobile"),
      actions: [
        cancelButton,
        continueButton,
      ],
      actionsAlignment: MainAxisAlignment.end,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 18),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
