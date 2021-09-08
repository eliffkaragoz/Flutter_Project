import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:staj/core/model/cart_model/cart.dart';
import 'package:staj/core/services/api_service.dart';
import 'package:staj/core/viewmodel/cart_view_model.dart';
import 'package:staj/ui/widgets/button_widget.dart';
import 'package:staj/ui/widgets/multiple_row.dart';
import 'package:staj/ui/widgets/navicon_menu.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartViewModel cartViewModel = CartViewModel();
  MultipleRow multipleRow = MultipleRow();
  NavIconMenu navIconMenu = NavIconMenu();
  ButtonWidget buttonWidget = ButtonWidget();
  List<Datum?> cartList = [];
  int total = 0;
  String? objGuid;

  ApiService apiService = ApiService();
  bool selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green),
        title: Row(children: [
          Spacer(
            flex: 2,
          ),
          Text(
            "Sepetim",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          Spacer(
            flex: 3,
          ),
        ]),
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder<List<Datum?>?>(
            future: cartViewModel.fetchCart(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    cartList = snapshot.data!;

                    return _listView;
                  }
                  return Center(
                    child: Text("Error "),
                  );
                default:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }
            },
          ),
        ),
        navIconMenu.buildNavIconMenu(Colors.white)
      ]),
    );
  }

  Widget get _listView => Column(children: [
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => Divider(),
            itemCount: cartList[0]!.requestList!.length,
            itemBuilder: (context, index) => Card(
              shadowColor: Colors.black,
              color: Colors.white,
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          "https://yesilparca.com/assets/images/brands/${cartList[0]!.requestList![index].brandLogo}",
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 100,
                          child: Text(
                            "${cartList[0]!.requestList![index].reqCatText}",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "YP-",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        Text(
                          "${cartList[0]!.requestList![index].reqNr}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    lineList(context, index),
                  ],
                ),
              ),
            ),
          ),
        ),
        Divider(),
        totalNotification(),
        //navIconMenu.buildNavIconMenu(Colors.white)
      ]);

  Widget lineList(BuildContext context, int index) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: cartList[0]!.requestList![index].requestLines!.length,
      itemBuilder: (context, i) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckboxWidgetControl(
                    context,
                    cartList[0]!.requestList![index].requestLines![i].isChecked,
                    index,
                    i),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "${cartList[0]!.requestList![index].requestLines![i].partTitle}",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 19),
                ),
                IconButton(
                    onPressed: () {
                      deleteIconClick();
                    },
                    icon: Icon(Icons.delete_outline_outlined)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            multipleRow.getRow(
                "Talep No : ",
                FontWeight.bold,
                "${cartList[0]!.requestList![index].requestLines![i].reqLineNr}",
                FontWeight.w400,
                17),
            SizedBox(
              height: 14,
            ),
            multipleRow.getRow(
                "Teklif No : ",
                FontWeight.bold,
                "${cartList[0]!.requestList![index].requestLines![i].responseLine!.respLineNr}",
                FontWeight.w400,
                17),
            Container(
              padding: EdgeInsets.all(30),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Tutar",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${cartList[0]!.requestList![index].requestLines![i].responseLine!.listPrice} ₺",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationStyle: TextDecorationStyle.solid,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${cartList[0]!.requestList![index].requestLines![i].responseLine!.discountedPrice} ₺",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget totalNotification() {
    return Stack(children: [
      SlidingUpPanel(
        minHeight: 120,
        panel: Padding(
          padding: EdgeInsets.only(left: 40, bottom: 40, right: 40),
          child: Center(
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sepet Tutarı",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${cartList[0]!.cartTotal} ₺",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                ]),
                buttonWidget.buttonWidget("Ödemeye Geç >", Colors.white,
                    Colors.green, () => null, 150, 45)
              ]),
              Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.green,
                size: 16,
              ),
              Divider(color: Colors.black38),
              SizedBox(height: 16),
              Text(
                "Sipariş Özeti",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ürün toplamı : ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  Text(
                    "${cartList[0]!.total} ₺",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kargo : ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  Text(
                    "${cartList[0]!.totalCargo} ₺",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hizmet Bedeli : ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  Text(
                    "${cartList[0]!.totalServiceFeeDiscountedPrice} ₺",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "İndirim : ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  Text(
                    "${cartList[0]!.totalDisc} ₺",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sepet Tutarı : ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  Text(
                    "${cartList[0]!.cartTotal} ₺",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    ]);
  }

  Widget CheckboxWidgetControl(
      BuildContext context, bool? isChecked, int index, int i) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setStates) {
        return Checkbox(
          value: isChecked,
          onChanged: (value) {
            setStates(() {
              isChecked = value!;
            });
            objGuid =
                cartList[0]!.requestList![index].requestLines![i].cartItemId;
            cartViewModel.fetchCheckStatus(isChecked!, objGuid!);
            setState(() {
              cartList.clear();
              cartViewModel.fetchCart()!.then((result) {
                cartList = result!;
              });
            });
          },
        );
      },
    );
  }

  deleteIconClick() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Ürün sepetten kaldırılacak, devam edilsin mi?",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonWidget.buttonWidget("Devam Et", Colors.white,
                      Colors.blue, () => Navigator.pop(context), 130, 30),
                  buttonWidget.buttonWidget("Vazgeç", Colors.white, Colors.red,
                      () => Navigator.pop(context), 130, 30)
                ],
              )
            ],
          );
        });
  }
}
