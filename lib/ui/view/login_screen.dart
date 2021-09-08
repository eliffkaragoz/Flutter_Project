import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staj/core/model/login_model/login.dart';
import 'package:staj/core/viewmodel/login_view_model.dart';
import 'package:staj/ui/view/home_screen.dart';
import 'package:staj/ui/widgets/button_widget.dart';
import 'package:staj/ui/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/services/storageUtil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextFieldWidget textFieldWidget = TextFieldWidget();
  LoginViewModel loginViewModel = LoginViewModel();
  ButtonWidget buttonWidget = ButtonWidget();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TabController? _controller;
  bool? isSelected = true;
  bool _obscureText = true;
  List<Datum?> loginList = [];
  SharedPreferences? localStorage;

  Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
    if (isSelected == true) {
      emailController.text = StorageUtil.getString("email");
      passwordController.text = StorageUtil.getString("password");
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(""),
        ),
        body: ListView(
          padding: EdgeInsets.all(30),
          children: [
            tabs,
            tabsView,
          ],
        ));
  }

  Widget get tabs => Container(
        child: Column(children: [
          SizedBox(
            height: 80,
          ),
          Card(
            color: Colors.grey,
            elevation: 23,
            borderOnForeground: true,
            margin: EdgeInsets.all(3),
            child: new TabBar(
              indicator: BoxDecoration(
                  border: Border.all(width: 9.0, color: Colors.white60),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  // borderRadius: BorderRadius.circular(30),
                  color: Colors.white),
              controller: _controller,
              tabs: [
                Container(
                  height: 80.0,
                  child: Tab(
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Üye Ol",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
  Widget get tabsView => Container(
        height: 880.0,
        child: new TabBarView(
          controller: _controller,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black54,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        hintText: "Email ,Telefon"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    cursorColor: Colors.black54,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        hintText: 'Şifre',
                        suffixIcon: FlatButton(
                            onPressed: _toggle,
                            child: Icon(Icons.remove_red_eye,
                                color: _obscureText
                                    ? Colors.black12
                                    : Colors.black54))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            isSelected = value!;
                          });
                        }),
                    Text(
                      "Beni Hatırla",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  buttonWidget.buttonWidget(
                      "Giriş Yap",
                      Colors.white,
                      Colors.green,
                      () => {
                            loginViewModel
                                .fetchLoginInformation(emailController.text,
                                    passwordController.text)
                                .then((result) async {
                              setState(() {
                                loginList = result!;
                              });
                              if (loginList.isNotEmpty) {
                                StorageUtil.putBool("isSelected", isSelected!);
                                if (isSelected == true) {
                                  StorageUtil.putString(
                                      "email", emailController.text);
                                  StorageUtil.putString(
                                      "password", passwordController.text);
                                }
                                StorageUtil.putString(
                                    "token", "Bearer ${loginList[0]!.token}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else {
                                Text("Yanlış Şifre");
                              }
                            })
                          },
                      350,
                      80),
                ],
              ),
            ),
            new Card(
                child: Container(
              child: Column(
                children: [],
              ),
            )),
          ],
        ),
      );
}
