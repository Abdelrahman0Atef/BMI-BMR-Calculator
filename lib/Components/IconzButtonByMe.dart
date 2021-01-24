import 'package:flutter/material.dart';

class IconButtonByMe extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  IconButtonByMe({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(height: 50, width: 50),
    );
  }
}