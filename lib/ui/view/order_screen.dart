import 'package:flutter/material.dart';
import 'package:staj/core/model/order_model/order.dart';
import 'package:staj/core/viewmodel/order_view_model.dart';
import 'package:staj/ui/widgets/button_widget.dart';
import 'package:staj/ui/widgets/multiple_column.dart';
import 'package:staj/ui/widgets/multiple_row.dart';
import 'package:staj/ui/widgets/navicon_menu.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  NavIconMenu navIconMenu = NavIconMenu();
  List<Datum?> orderList = [];
  ButtonWidget buttonWidget = ButtonWidget();
  MultipleRow multipleRow = MultipleRow();
  MultipleColumn multipleColumn = MultipleColumn();
  OrderViewModel orderViewModel = OrderViewModel();
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
              "Siparişlerim",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
            Spacer(
              flex: 3,
            ),
          ]),
          backgroundColor: Colors.white,
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              color: Colors.white10,
              child: FutureBuilder<List<Datum?>?>(
                future: orderViewModel.fetchOrders(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        orderList = snapshot.data!;
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
          ),
          navIconMenu.buildNavIconMenu(Colors.white)
        ]));
  }

  Widget get _listView => ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        scrollDirection: Axis.vertical,
        itemCount: orderList.length,
        itemBuilder: (context, index) => Card(
          shadowColor: Colors.black,
          color: Colors.white,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                multipleColumn.getColumn(
                                    "Sipariş No", "${orderList[index]!.nr}"),
                                SizedBox(
                                  height: 20,
                                ),
                                multipleColumn.getColumn("Sipariş Özeti",
                                    "Toplam ${orderList[index]!.lines!.length.toString()} Ürün"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                multipleColumn.getColumn("Sipariş Tarihi",
                                    "${orderList[index]!.date}"),
                                SizedBox(
                                  height: 20,
                                ),
                                multipleColumn.getColumn("Tutar",
                                    "${orderViewModel.getTotalTutar(context, index, orderList)} TL")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                    itemCount: orderList[index]!.lines!.length,
                    itemBuilder: (context, i) => Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(children: [
                                Image.network(
                                  "https://yesilparca.com/assets/images/brands/${orderList[index]!.brandLogo!}",
                                  height: 100,
                                  width: 100,
                                ),
                                Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "${orderList[index]!.lines![i].partTitle}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 160,
                                        child: Text(
                                          "${orderList[index]!.lines![i].catText}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ]),
                              ]),
                              multipleRow.getRow(
                                  "\nTalep No : ",
                                  FontWeight.bold,
                                  "\n YP-${orderList[index]!.lines![i].nr}",
                                  FontWeight.w400,
                                  14),
                              multipleRow.getRow(
                                  "Sipariş No : ",
                                  FontWeight.bold,
                                  "${orderList[index]!.lines![i].orderNr}",
                                  FontWeight.w400,
                                  14),
                              multipleRow.getRow(
                                  "Tutar : ",
                                  FontWeight.bold,
                                  "${orderList[index]!.lines![i].total} TL",
                                  FontWeight.w400,
                                  14),
                              SizedBox(
                                height: 10,
                              ),
                              getKargoStatus(context, orderList, index, i),
                              buttonWidget.buttonWidget(
                                  "Sipariş Detayı",
                                  Colors.white,
                                  Colors.green,
                                  () => _buildDialog(context, index, i),
                                  120,
                                  30),
                            ],
                          ),
                        ))
              ],
            ),
          ),
        ),
      );

  _buildDialog(BuildContext context, int index, int i) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStates) => Dialog(
              insetPadding:
                  EdgeInsets.only(right: 15, left: 15, bottom: 40, top: 40),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.close,
                              color: Colors.black45, size: 30),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "Sipariş Detayı",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "${orderList[index]!.lines![i].catText}",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${orderList[index]!.lines![i].title}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Talep No : ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 17),
                        ),
                        Text(
                          "YP-${orderList[index]!.lines![i].nr}",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "\nSipariş Durumu : ",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900),
                        ),
                        Text("\n${orderList[index]!.lines![i].status}",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Divider(),
                    multipleRow.getRow(
                        "\nKargo No : ",
                        FontWeight.bold,
                        "\n${orderList[index]!.lines![i].shipTrackNr}",
                        FontWeight.w400,
                        17),
                    Divider(),
                    multipleRow.getRow(
                        "\nTutar : ",
                        FontWeight.bold,
                        "\n${orderList[index]!.lines![i].total} TL",
                        FontWeight.w400,
                        17),
                    Container(
                        alignment: Alignment.topRight,
                        child: buttonWidget.buttonWidget(
                            "Kapat",
                            Colors.black,
                            Colors.yellow,
                            () => Navigator.pop(context),
                            150,
                            30))
                  ],
                ),
              ),
            ),
          );
        });
  }

  getKargoStatus(
      BuildContext context, List<Datum?> orderList, int index, int i) {
    if (orderList[index]!.lines![i].status == "Satıcı Onayı Bekliyor") {
      return kargoOnayiKontrol(
          "Satıcı Onayı Bekliyor", Icons.downloading_sharp);
    }
    if (orderList[index]!.lines![i].status == "Satıcı İadeyi Onayladı") {
      return kargoOnayiKontrol("Satıcı İadeyi Onayladı", Icons.done);
    }
    if (orderList[index]!.lines![i].status == "Teslim Edildi") {
      return kargoOnayiKontrol("Teslim Edildi", Icons.done);
    }
    if (orderList[index]!.lines![i].status == "Kargolandı") {
      return kargoOnayiKontrol("Kargolandı", Icons.car_repair);
    }
    if (orderList[index]!.lines![i].status ==
        "Müşteri İadenin Reddine İtiraz Etti") {
      return kargoOnayiKontrol(
          "Müşteri İadenin Reddine\nİtiraz Etti", Icons.clear);
    }
    if (orderList[index]!.lines![i].status == "İade Oluşturuldu") {
      return kargoOnayiKontrol("İade Oluşturuldu", Icons.done);
    }
    if (orderList[index]!.lines![i].status == "Satıcı Reddetti") {
      return kargoOnayiKontrol("Satıcı Reddetti", Icons.clear);
    }
    if (orderList[index]!.lines![i].status == "Satıcı Onayladı") {
      return kargoOnayiKontrol("Satıcı Onayladı", Icons.done);
    }
    if (orderList[index]!.lines![i].status == "İade Başarıyla Teslim Edildi") {
      return kargoOnayiKontrol("İade Başarıyla Teslim Edildi", Icons.done);
    }
    if (orderList[index]!.lines![i].status == "Satıcı İadeyi Reddetti") {
      return kargoOnayiKontrol("Satıcı İadeyi Reddetti", Icons.clear);
    }
    if (orderList[index]!.lines![i].status == "Teslim Edildi") {
      return kargoOnayiKontrol("Teslim Edildi", Icons.done);
    } else {
      return Text("");
    }
  }

  kargoOnayiKontrol(String text, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "${text}",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          iconData,
          color: Colors.green,
          size: 27,
        ),
      ],
    );
  }
}
