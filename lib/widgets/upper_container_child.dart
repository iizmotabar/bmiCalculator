import 'package:flutter/material.dart';

class UpperChildContainerContent extends StatelessWidget {
  final IconData icon;
  final String title;
  const UpperChildContainerContent({
    Key key,
    this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(title, style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98))),
      ],
    );
  }
}
