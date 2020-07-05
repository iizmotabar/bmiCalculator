import 'package:flutter/material.dart';

class InputScreenContainers extends StatelessWidget {
  final Color color;
  final Widget containerChild;
  final Function fxn;

  InputScreenContainers({@required this.color, this.containerChild, this.fxn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fxn,
      child: Container(
        child: containerChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
