import 'package:flutter/material.dart';

class MultipleColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Boşşşşş"),
    );
  }

  Widget getColumn(String text, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 5,
        ),
        Text(value)
      ],
    );
  }
}
