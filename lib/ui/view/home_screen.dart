import 'package:flutter/material.dart';
import 'package:staj/ui/view/cart_screen.dart';
import 'package:staj/ui/view/login_screen.dart';
import 'package:staj/ui/widgets/button_widget.dart';

import 'account_information_screen.dart';
import 'adress_screen.dart';
import 'claims_screen.dart';

import 'order_screen.dart';

class HomeScreen extends StatelessWidget {
  ButtonWidget buttonWidget = ButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home",
                style: TextStyle(fontSize: 22, color: Colors.green),
              ),
              Text("Screen",
                  style: TextStyle(fontSize: 22, color: Colors.green))
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: buildBody(context),
        ));
  }

  Widget buildBody(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonWidget.buttonWidget(
              "   Adres Sayfası   ",
              Colors.white,
              Colors.green,
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddressScreen()))
                  },
              170,
              45),
          SizedBox(
            height: 30,
          ),
          buttonWidget.buttonWidget(
              "  Talepler Sayfası ",
              Colors.white,
              Colors.green,
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ClaimsScreen()))
                  },
              170,
              45),
          SizedBox(
            height: 30,
          ),
          buttonWidget.buttonWidget(
              "Siparişler Sayfası",
              Colors.white,
              Colors.green,
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderScreen()))
                  },
              170,
              45),
          SizedBox(
            height: 30,
          ),
          buttonWidget.buttonWidget(
              "Sepet Sayfası",
              Colors.white,
              Colors.green,
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()))
                  },
              170,
              45),
          SizedBox(
            height: 30,
          ),
          buttonWidget.buttonWidget(
              "Hesap Bilgilerim",
              Colors.white,
              Colors.green,
              () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountInformationScreen()))
                  },
              170,
              45),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ));
  }
}
