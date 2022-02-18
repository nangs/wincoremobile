// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({
    Key? key,
    required this.dateFormated,
    required this.notificationTitle,
    required this.notificationContent,
  }) : super(key: key);

  final String dateFormated;
  final String notificationTitle;
  final String notificationContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dateFormated,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 10,
            ),
          ),
          Text(
            notificationTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(notificationContent),
        ],
      ),
    );
  }
}
