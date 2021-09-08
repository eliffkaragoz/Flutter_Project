import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Boşşşşş"),
    );
  }

  Widget buttonWidget(String text, Color textColor, Color buttonColor,
      Function() function, double weight, double height) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: buttonColor, fixedSize: Size(weight, height)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
      ),
      onPressed: function,
    );
  }
}
