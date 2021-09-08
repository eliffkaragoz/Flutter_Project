import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staj/core/model/listAddress_model/listAddress.dart';

import 'package:staj/core/services/storageUtil.dart';
import 'package:staj/core/viewmodel/account_information_view_model.dart';
import 'package:staj/core/model/userInfo_model/userInfo_model.dart';
import 'package:staj/ui/widgets/button_widget.dart';
import 'package:staj/ui/widgets/multiple_row.dart';
import 'package:staj/ui/widgets/navicon_menu.dart';
import 'package:staj/ui/widgets/textfield_widget.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({Key? key}) : super(key: key);

  @override
  _AccountInformationScreenState createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen>
    with SingleTickerProviderStateMixin {
  AccountInformationViewModel accountInformationViewModel =
      AccountInformationViewModel();
  NavIconMenu navIconMenu = NavIconMenu();
  ButtonWidget buttonWidget = ButtonWidget();
  MultipleRow multipleRow = MultipleRow();
  TextFieldWidget textFieldWidget = TextFieldWidget();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TabController? _controller;

  List<Data?> listAddress = [];
  List<Datum?> userInfoList = [];

  bool isEmailPermission = false;
  bool isSmsPermission = false;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);

    nameController.text = StorageUtil.getString("firstName");
    surnameController.text = StorageUtil.getString("lastName");
    emailController.text = StorageUtil.getString("email");
    telephoneController.text = StorageUtil.getString("mobile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.green),
                title: Row(children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Hesap Bilgilerim",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ]),
              )
            ];
          },
          body: Column(
            children: [
              _tabs,
              _tabsView,
              // navIconMenu.buildNavIconMenu(Colors.white)
            ],
          ),
        )),
      ),
    );
  }

  Widget get _tabs => Container(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Card(
            color: Colors.grey,
            elevation: 4,
            borderOnForeground: true,
            margin: EdgeInsets.all(3),
            child: new TabBar(
              indicator: BoxDecoration(color: Colors.yellow),
              controller: _controller,
              tabs: [
                Tab(
                  child: Text(
                    "HESAP AYARLARIM",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    "ADRESLERİM",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
  Widget get _tabsView => Expanded(
          child: TabBarView(
        controller: _controller,
        children: [
          FutureBuilder<List<Datum?>?>(
            future: accountInformationViewModel.fetchUserInfo(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    userInfoList = snapshot.data!;
                    StorageUtil.putString(
                        "firstName", "${userInfoList[0]!.firstName}");
                    StorageUtil.putString(
                        "lastName", "${userInfoList[0]!.lastName}");
                    StorageUtil.putString("email", "${userInfoList[0]!.email}");
                    StorageUtil.putString(
                        "mobile", "${userInfoList[0]!.mobile}");
                    return userInfoTabBody;
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
          ),
          FutureBuilder<List<Data?>?>(
            future: accountInformationViewModel.fetchAllAddresses(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    listAddress = snapshot.data!;

                    return addressTabBody;
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
        ],
      ));
  Widget get userInfoTabBody => Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                textFieldWidget.buildTextField(
                    "Adınız", TextInputType.text, nameController, 150, 35),
                textFieldWidget.buildTextField(
                    "Soyadınız", TextInputType.text, surnameController, 150, 35)
              ]),
              SizedBox(
                height: 35,
              ),
              textFieldWidget.buildTextField(
                  "E Posta", TextInputType.text, emailController, 360, 35),
              SizedBox(
                height: 35,
              ),
              textFieldWidget.buildTextField(
                  "Telefon", TextInputType.text, telephoneController, 360, 35),
              SizedBox(
                height: 60,
              ),
              CheckboxListTile(
                  title: Text(
                      "Önemli kampanyalardan e-posta ile haberdar olmak istiyorum."),
                  value: isEmailPermission,
                  onChanged: (value) {
                    setState(() {
                      isEmailPermission = value!;
                    });
                  }),
              CheckboxListTile(
                  title: Text(
                      " Önemli kampanyalardan SMS ile haberdar olmak istiyorum. "),
                  value: isSmsPermission,
                  onChanged: (value) {
                    setState(() {
                      isSmsPermission = value!;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              buttonWidget.buttonWidget(
                  "Kaydet", Colors.white, Colors.green, () => null, 200, 40)
            ]),
          ],
        ),
      );

  Widget get addressTabBody => ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: listAddress.length,
        itemBuilder: (context, index) => Container(
          child: Card(
            shadowColor: Colors.black,
            elevation: 13,
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.green,
                      ),
                      Text(
                        "${listAddress[index]!.addressTitle}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("${listAddress[index]!.address1}"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${listAddress[index]!.city} / ${listAddress[index]!.town}",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  multipleRow.getRow("Telefon : ", FontWeight.w800,
                      "${listAddress[index]!.tel} ", FontWeight.w400, 17),
                  SizedBox(
                    height: 6,
                  ),
                  multipleRow.getRow(
                      "Fatura Türü : ",
                      FontWeight.w800,
                      "${listAddress[index]!.invoiceAddressTyp} ",
                      FontWeight.w400,
                      17),
                  SizedBox(
                    height: 6,
                  ),
                  multipleRow.getRow("TC No : ", FontWeight.w800,
                      "${listAddress[index]!.tckNo} ", FontWeight.w400, 17)
                ],
              ),
            ),
          ),
        ),
      );
}
