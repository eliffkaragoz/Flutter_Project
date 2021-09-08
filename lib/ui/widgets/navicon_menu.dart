import 'package:flutter/material.dart';

class NavIconMenu {




  Widget buildNavIconMenu(Color color) {
    return Expanded(
      flex: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: color,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavIcon(iconData: Icons.home_filled, active: true),
              buildNavIcon(iconData: Icons.person, active: false),
              buildNavIcon(iconData: Icons.add_box, active: false),
              buildNavIcon(iconData: Icons.push_pin_outlined, active: false),
              buildNavIcon(iconData: Icons.call, active: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavIcon({required IconData iconData, required bool active}) {
    return Icon(iconData, size: 35, color: Colors.black54);
  }
}
