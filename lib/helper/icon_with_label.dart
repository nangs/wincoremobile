import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  const IconWithLabel(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor,
      required this.textColor})
      : super(key: key);

  final IconData icon;
  final String text;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class HorizontalFlatMenuWithIcon extends StatelessWidget {
  const HorizontalFlatMenuWithIcon({
    Key? key,
    required this.nameMenu,
    required this.icon,
  }) : super(key: key);

  final String nameMenu;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(nameMenu),
      ],
    );
  }
}
