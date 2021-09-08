import 'package:flutter/material.dart';

class MultipleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Boşşşşş"),
    );
  }

  Widget getRow(String text, FontWeight fontWeight, String value,
      FontWeight valueFontWeight, double size) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: fontWeight, fontSize: size),
        ),
        Text(
          value,
          style: TextStyle(fontSize: size, fontWeight: valueFontWeight),
        )
      ],
    );
  }
}
