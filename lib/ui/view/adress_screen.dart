import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staj/core/model/address_model/address_data.dart';
import 'package:staj/core/viewmodel/address_view_model.dart';
import 'package:staj/core/model/createAddress_model.dart';
import 'package:staj/ui/widgets/button_widget.dart';
import 'package:staj/ui/widgets/textfield_widget.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  AddressViewModel addressViewModel = AddressViewModel();
  ButtonWidget buttonWidget = ButtonWidget();
  TextFieldWidget textFieldWidget = TextFieldWidget();

  String? selectedCity;
  String? selectedDistrict;
  List<Datum?> cityList = [];
  List<Datum?> districtList = [];
  List<CreateAddressResponse?> createList = [];
  String? cityID;
  String? addressTypeValue;

  List list3 = [
    'mahalle',
    'cadde',
  ];

  TextEditingController addressTitleController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressTypeController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Address",
                style: TextStyle(fontSize: 22, color: Colors.green),
              ),
              Text("Screen",
                  style: TextStyle(fontSize: 22, color: Colors.green))
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder<List<Datum?>?>(
          future: addressViewModel.fetchCities(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  cityList = snapshot.data!;
                  return Center(
                      child: buttonWidget.buttonWidget(
                          "Adres Ekle", Colors.white, Colors.green, () {
                    setState(() {
                      buildDialog(context);
                      // makePostRequest();
                    });
                  }, 150, 45));
                }
                return Center(
                  child: Text("Error"),
                );
              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ));
  }

  Future buildDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setStates) {
            return Dialog(
              insetPadding:
                  EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 20),
              child: SingleChildScrollView(
                //Kaydırma yapmak için
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      _buildDialogTitleWidget(context),
                      SizedBox(
                        height: 19,
                      ),
                      _buildDialogBodyWidget(context, setStates),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          buttonWidget.buttonWidget(
                              "Vazgeç",
                              Colors.black,
                              Colors.yellow,
                              () => {Navigator.pop(context)},
                              120,
                              30),
                          Spacer(
                            flex: 2,
                          ),
                          buttonWidget.buttonWidget(
                              "Ekle",
                              Colors.white,
                              Colors.green,
                              () => {
                                    addressViewModel
                                        .createAddress(
                                            adressController.text,
                                            addressTitleController.text,
                                            "ankara",
                                            6,
                                            emailController.text,
                                            "1",
                                            "AA",
                                            "BB",
                                            "11111111111",
                                            phoneController.text,
                                            "Akyurt",
                                            1,
                                            1)
                                        .then((result) async {
                                      setState(() {
                                        createList = result!;
                                      });
                                      //  showDialog(context: context, builder: builder)
                                    })
                                  },
                              120,
                              30),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Widget _buildDialogTitleWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Spacer(flex: 10),
          Text(
            "Adres",
            style: TextStyle(fontSize: 25),
          ),
          Text("Ekle", style: TextStyle(fontSize: 25, color: Colors.green)),
          Spacer(flex: 9),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
              child: Icon(Icons.close, color: Colors.black45, size: 30),
              backgroundColor: Colors.white,
            ),
          ),
        ]),
      ],
    );
  }

  Widget _buildDialogBodyWidget(BuildContext context, StateSetter setStates) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          textFieldWidget.buildTextField("Adres Başlığı",
              TextInputType.emailAddress, addressTitleController, 350, 35),
          SizedBox(
            height: 25,
          ),
          shortDropDownWidget(setStates, "İl seçin"),
          SizedBox(
            height: 25,
          ),
          textFieldWidget.buildTextField(
              "E-posta", TextInputType.emailAddress, emailController, 350, 35),
          SizedBox(
            height: 25,
          ),
          textFieldWidget.buildTextField(
              "Telefon", TextInputType.phone, phoneController, 350, 35),
          SizedBox(
            height: 25,
          ),
          longDropDownWidget(
            "Adres Türü",
            setStates,
          ),
          SizedBox(
            height: 25,
          ),
          textFieldWidget.buildTextField(
              "Adres", TextInputType.text, adressController, 350, 35),
        ],
      ),
    );
  }

  Widget shortDropDownWidget(StateSetter setStates, String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            height: 35,
            width: 150,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black45)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: selectedCity,
                items: cityList
                    .map((e) => DropdownMenuItem(
                          value: e!.cityid.toString(),
                          child: Text(
                            "${e.name}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ))
                    .toList(),
                onChanged: (value) async {
                  districtList.clear();
                  setStates(() {
                    selectedDistrict = null;
                    selectedCity = value.toString();
                  });
                  cityID = value.toString();
                  //selectedDistrict = "aaa";
                  await addressViewModel.fetchDistricts(cityID!).then((value) {
                    setStates(() {
                      districtList = value!;
                    });
                  });
                },
                hint: Text("İl seçin"),
                focusColor: Colors.white,
                icon: Container(
                  margin: EdgeInsets.only(left: 2.0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ),
                iconEnabledColor: Colors.green,
              ),
            ),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("İlçe Seçin",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            height: 35,
            width: 150,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black45)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: selectedDistrict,
                items: districtList.map((e) {
                  return DropdownMenuItem(
                    value: e!.name.toString(),
                    child: Text(
                      "${e.name}",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (value) async {
                  setStates(() {
                    selectedDistrict = value.toString();
                  });
                },
                hint: Text("İlçe seçin"),
                focusColor: Colors.white,
                style: TextStyle(color: Colors.white),
                icon: Container(
                    margin: EdgeInsets.only(left: 2.0),
                    child: Icon(Icons.keyboard_arrow_down)),
                iconEnabledColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  Widget longDropDownWidget(String text, StateSetter setStates) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Container(
          height: 35,
          width: 350,
          decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
          child: DropdownButton<String>(
            focusColor: Colors.white,
            value: addressTypeValue,
            style: TextStyle(color: Colors.white),
            icon: Container(
              margin: EdgeInsets.only(left: 270.0),
              child: Icon(
                Icons.keyboard_arrow_down,
              ),
            ),
            iconEnabledColor: Colors.green,
            items: list3.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value!,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setStates(() {
                addressTypeValue = value!;
              });
            },
          ),
        )
      ],
    );
  }
}
