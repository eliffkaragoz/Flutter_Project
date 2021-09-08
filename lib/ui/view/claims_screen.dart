import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:staj/core/model/claims_model/claims_data.dart';
import 'package:staj/core/viewmodel/claim_view_model.dart';
import 'package:staj/ui/widgets/navicon_menu.dart';
import 'offer_screen.dart';

class ClaimsScreen extends StatefulWidget {
  @override
  _ClaimsScreenState createState() => _ClaimsScreenState();
}

class _ClaimsScreenState extends State<ClaimsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  ClaimViewModel claimViewModel = ClaimViewModel();
  NavIconMenu navIconMenu = NavIconMenu();

  List<Datum?> claimsList = [];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                      "Talepler",
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
                _tabBar,
                _tabBarView,
                navIconMenu.buildNavIconMenu(Colors.yellow)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _tabBar => TabBar(
        dragStartBehavior: DragStartBehavior.start,
        controller: _tabController,
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        labelColor: Colors.black,
        isScrollable: true,
        indicatorColor: Colors.yellow,
        indicatorWeight: 5,
        tabs: [
          Tab(
            text: 'Yayındakiler',
          ),
          Tab(text: 'Taslaklar'),
          Tab(text: 'Pasifler'),
          Tab(text: 'Arşiv'),
        ],
      );
  Widget get _tabBarView => Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            FutureBuilder<List<Datum?>?>(
              future: claimViewModel.fetchClaims(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      claimsList = snapshot.data!;
                      return _listView;
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
            Center(
              child: Container(
                //color: Colors.blue,
                child: Text(
                  "TASLAKLAR SAYFASI",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  "PASİFLER SAYFASI ",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  "ARŞİV SAYFASI ",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      );
  Widget get _listView => ListView.separated(
      itemCount: claimsList.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => Card(
            elevation: 0.0,
            child: Container(
                padding: EdgeInsets.all(27.0),
                //       margin: new EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.green,
                      ),
                      Text(
                        "YP- ${claimsList[index]!.nr}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Icon(
                        Icons.edit_outlined,
                        size: 29,
                        color: Colors.green,
                      )
                    ],
                  ),
                  Image.network(
                    "https://yesilparca.com/assets/images/brands/${claimsList[index]!.brandLogo!}",
                    height: 100,
                    width: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${claimsList[index]!.marka!.text} ${claimsList[index]!.model!.text}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 19),
                      ),
                      Text(
                        "  ${claimsList[index]!.kasa!.text} ${claimsList[index]!.motor!.text} ${claimsList[index]!.beygir!.text}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 19),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 15,
                      ),
                      Text(
                        " ${claimsList[index]!.remaingTime}",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Icon(
                        Icons.calendar_today_sharp,
                        size: 15,
                        color: Colors.black45,
                      ),
                      Text(
                        " ${claimsList[index]!.date}",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  Divider(),
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, i) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OfferScreen(
                                            objGuid:
                                                '${claimsList[index]!.objGuid}',
                                          )));
                            },
                            child: Row(children: [
                              Container(
                                width: 270,
                                child: Text(
                                  "${i + 1}. ${claimsList[index]!.lines![i].partTitle}",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              //  claimsList[index].lines[i].
                            ]),
                          ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: claimsList[index]!.lines!.length)
                ])),
          ));
}
