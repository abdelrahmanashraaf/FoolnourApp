import 'package:ecom/emuns/apptypes.dart';
import 'package:ecom/screens/drawer.dart';
import 'package:ecom/dokan/screens/dokanVendorsWidget.dart';
import 'package:ecom/wcfm/screens/wcfmVendorsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecom/WidgetHelper/CustomIcons.dart';
import 'package:ecom/main.dart';
import 'package:ecom/screens/homefragments/cartWidget.dart';
import 'package:ecom/screens/homefragments/categoryWidget.dart';
import 'package:ecom/screens/homefragments/productsWidget.dart';
import 'package:ecom/screens/homefragments/settingwidget.dart';
import 'package:ecom/utils/appTheme.dart';
import 'package:ecom/utils/consts.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget  {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

 class _HomeScreenState extends State<HomeScreen>   {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool enabled = false; // tracks if drawer should be opened or not
  @override
  void initState() {
    super.initState();
    prefs!.setBool(ISFIRSTOPEN, false);

    Firebase.initializeApp().whenComplete(() {
      print("completed initializeApp");
      setState(() {});
    });
//    FirebaseFirestore.instance.collection('versions').document("updatedVersion").get().then((value) {
//      bool updateNow=value.data()["updateNow"];
//      String versionandroid=value.data()["versionandroid"];
//      String versionios=value.data()["versionios"];
//      if(updateNow)
//      {
//        PackageInfo.fromPlatform().then((packageInfo){
//          String versionName = packageInfo.version;
//          String versionCode = packageInfo.buildNumber;
//
//          if (
//          ((Platform.isIOS &&versionName!=versionios) || (Platform.isAndroid &&versionName!=versionandroid))
//          ){
//            Navigator.pushNamed(context, '/update' );
//          }
//        });
//      }
//    });

  }
  @override
  Widget build(BuildContext context) {
    // WooHttpRequest().getDashboard(dashboard_page).then((value) {
    //   dashboardBloc.refreshDashboards(value);
    // });

    return DefaultTabController(  // Added
      length: TabBarCount,  // Added
      initialIndex: 0, //Added
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(child: SideDrawer()),
        backgroundColor: BackgroundColor,
        bottomNavigationBar: navTabItem(),
        body: SafeArea(
          child:body(),
        )
      )
    );
  }

  Widget body() {
    List<Widget> tabChilds=[
      ProductScreen(),
      CategoryScreen(),
    ];

    if (APPTYPE == AppType.WCFM )
      tabChilds.add(WcfmVendorScreen());
    if (APPTYPE == AppType.Dokan )
      tabChilds.add(DokanVendorScreen());

    tabChilds.addAll(
      [
        CartScreen(false),
        SettingScreen(() {
          setState(() {});
        }),
      ]
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  color: BackgroundColor,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              drawerButtonIcon(() {
                                _scaffoldKey.currentState!.openDrawer();
                              }, Icons.apps),
                              Text('مطعم ',style:  TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                              Text('نور', style:  TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),),


                              // delme
                            ],
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //   ],
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 50, top: 10),
                          child: Image.asset(
                            'assets/logo.png',
                            width: 75,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),
          Expanded(
            flex: 10,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: tabChilds
            ),
          ),
        ],
      ),
    );
  }

}
