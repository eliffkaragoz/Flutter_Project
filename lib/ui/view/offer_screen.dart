import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staj/core/model/offer_model/offer.dart';
import 'package:staj/core/viewmodel/offer_view_model.dart';
import 'package:staj/ui/widgets/multiple_row.dart';

class OfferScreen extends StatefulWidget {
  String objGuid;

  OfferScreen({required this.objGuid});

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  MultipleRow multipleRow = MultipleRow();
  List<Datum?> offersList = [];
  String? selectedValue;
  bool? empty;
  String? title;
  int? lineNr;
  List<ResponseList> responseList = [];

  set deger(int? deger) {}

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
            "Teklifler",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          Spacer(
            flex: 3,
          ),
          Icon(Icons.menu)
        ]),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Datum?>?>(
        future: OfferViewModel().fetchOffers(widget.objGuid),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                offersList = snapshot.data!;

                return _body;
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
    );
  }

  Widget get _body => Container(
        child: Card(
          margin: EdgeInsets.all(20.0),
          child: Container(
              padding: EdgeInsets.all(27.0),
              child: Column(
                children: [
                  Image.network(
                    "https://yesilparca.com/assets/images/brands/${offersList[0]!.brandLogo!}",
                    height: 100,
                    width: 100,
                  ),
                  Text("${offersList[0]!.catText}",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 19)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.green,
                      ),
                      Text(
                        "YP- ${offersList[0]!.nr}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  dropDown(),
                  Divider(
                    color: Colors.black,
                  ),
                  responseList.isNotEmpty
                      ? Container(
                          child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${offersList[0]!.lines![lineNr! - 1].responseList![0].title}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 19),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text(
                                      "Liste Fiyatı : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "${offersList[0]!.lines![lineNr! - 1].responseList![0].listPrice} TL",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                multipleRow.getRow(
                                    "İndirimli Fiyatı : ",
                                    FontWeight.bold,
                                    "${offersList[0]!.lines![lineNr! - 1].responseList![0].discountedPrice} TL",
                                    FontWeight.w400,
                                    16),
                                SizedBox(
                                  height: 10,
                                ),
                                multipleRow.getRow(
                                    "Kargo : ",
                                    FontWeight.bold,
                                    "${offersList[0]!.lines![lineNr! - 1].responseList![0].cargoPrice} TL",
                                    FontWeight.w400,
                                    16),
                                SizedBox(
                                  height: 10,
                                ),
                                multipleRow.getRow(
                                    "Toplam : ",
                                    FontWeight.bold,
                                    "${offersList[0]!.lines![lineNr! - 1].responseList![0].totalPrice} TL",
                                    FontWeight.w400,
                                    16)
                              ]),
                            ),
                          ],
                        ))
                      : Container(
                          child: Column(
                          children: [
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Eklenmiş teklif kaydı bulunmuyor.",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [])
                      ],
                    ),
                  )
                ],
              )),
        ),
      );

  getOffers() {
    if (offersList[0]!.lines![lineNr! - 1].responseList!.isNotEmpty) {
      for (int i = 0;
          i < offersList[0]!.lines![lineNr! - 1].responseList!.length;
          i++) {
        responseList = offersList[0]!.lines![lineNr! - 1].responseList!;
      }
    } else {
      responseList = [];
      if (responseList.isEmpty) {}
    }
  }

  dropDown() {
    return DropdownButton(
        hint: Text("Seçim Yapınız"),
        focusColor: Colors.blueGrey,
        dropdownColor: Colors.white,
        value: selectedValue,
        items: offersList[0]!
            .lines!
            .map((e) => DropdownMenuItem(
                  value: e.partTitle,
                  child: Text("${e.partTitle}"),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedValue = value.toString();
            for (int i = 0; i < offersList[0]!.lines!.length; i++) {
              if (selectedValue == offersList[0]!.lines![i].partTitle) {
                lineNr = (offersList[0]!.lines![i].lineNr);
              }
            }
            getOffers();
          });
        });
  }
}
