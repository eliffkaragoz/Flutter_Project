import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Boşşşşş"),
    );
  }

  Widget buildTextField(String baslik, TextInputType inputType,
      TextEditingController controller, double width, double height) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(baslik,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            width: width,
            height: height,
            child: TextField(
                controller: controller,
                keyboardType: inputType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                )),
          )
        ],
      ),
    );
  }
}
