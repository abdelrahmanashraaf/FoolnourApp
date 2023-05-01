import 'package:ecom/screens/blogPostDetailWidget.dart';
import 'package:ecom/screens/blogPostListWidget.dart';
import 'package:ecom/screens/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:ecom/screens/aboutuswidget.dart';
import 'package:ecom/screens/homefragments/cartWidget.dart';
import 'package:ecom/screens/checkOutTabWidget.dart';
import 'package:ecom/screens/homeWidget.dart';
import 'package:ecom/screens/introWidget.dart';
import 'package:ecom/screens/loginWidget.dart';
import 'package:ecom/screens/homeProductDetailWidget.dart';
import 'package:ecom/screens/orderhistoryWidget.dart';
import 'package:ecom/screens/updateWidget.dart';
import 'package:ecom/screens/userProfileWidget.dart';
import 'package:ecom/screens/splashWidget.dart';
import 'package:ecom/screens/wishListWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

// WidgetsBinding.instance.window.physicalSize.width;
// SharedPreferences.setMockInitialValues({});
//drawer UI Update ,set all strings in app for multilanguage .
SharedPreferences? prefs;
void main() {
  return runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Directionality(textDirection: TextDirection.rtl,child:SplashWidget()),
      '/intro': (context) => Directionality(textDirection: TextDirection.rtl,child:IntroScreen()),
      '/update': (context) => Directionality(textDirection: TextDirection.rtl,child:UpdateWidget()),
      '/login': (context) => Directionality(textDirection: TextDirection.rtl,child:LoginWidget()),
      '/home': (context) => Directionality(textDirection: TextDirection.rtl,child:HomeScreen()),
      '/search': (context) => Directionality(textDirection: TextDirection.rtl,child:SearchScreen()),
      '/homeproductdetail': (context) => Directionality(textDirection: TextDirection.rtl,child:HomeProdcutDetailScreen()),
      '/aboutus': (context) => Directionality(textDirection: TextDirection.rtl,child:AboutusScreen()),
      '/orders': (context) => Directionality(textDirection: TextDirection.rtl,child:OrdersScreen()),
      '/checkOutTab': (context) => Directionality(textDirection: TextDirection.rtl,child:CheckOutTabScreen()),
      // '/wishlist': (context) => Directionality(textDirection: TextDirection.rtl,child:WishListScreen()),
      '/cart': (context) => Directionality(textDirection: TextDirection.rtl,child:CartScreen(false)),
      '/userprofile': (context) => Directionality(textDirection: TextDirection.rtl,child:UserProfileScreen()),
      // '/blogpost': (context) => Directionality(textDirection: TextDirection.rtl,child:BlogPostListScreen()),
    },
    debugShowCheckedModeBanner: false,
  ));

}
