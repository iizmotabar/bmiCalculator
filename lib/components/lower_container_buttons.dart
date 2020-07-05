import 'package:flutter/material.dart';

class LowerContainerIconButtons extends StatelessWidget {
 
  final IconData icon;
  final Function fxn;

  const LowerContainerIconButtons(
      { this.icon, this.fxn});

  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawMaterialButton(
          
            child: Icon(icon),
            onPressed: fxn,
            shape: CircleBorder(),
            fillColor: Color(0xFF4C4F5E),
            elevation: 20,
            constraints: BoxConstraints.tightFor(
              height: 56.0,
              width: 56.0,
            ),
          ),
      
      
    );
  }
}
