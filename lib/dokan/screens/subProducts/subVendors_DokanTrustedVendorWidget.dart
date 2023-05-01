import 'package:ecom/http/customhttprequest.dart';
import 'package:ecom/http/woohttprequest.dart';
import 'package:ecom/models/api/dashboard/getDashboardProducts.dart';
import 'package:ecom/utils/commonMethod.dart';
import 'package:ecom/dokan/list_views/trusted_dokanvendor_grid_view.dart';
import 'package:ecom/dokan/models/api/vendor/getAllDokanVendorsResponceModel.dart';
import 'package:ecom/dokan/woohttprequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecom/list_views/home_product_grid_view.dart';
import 'package:ecom/utils/appTheme.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class SubVendor_DokanTrustedVendorScreen extends StatefulWidget {
  List<GetAllDokanVendors> trustedVendors;
  SubVendor_DokanTrustedVendorScreen(this.trustedVendors);
  @override
  _SubVendor_TrustedVendorScreenState createState() => _SubVendor_TrustedVendorScreenState();
}

class _SubVendor_TrustedVendorScreenState extends State<SubVendor_DokanTrustedVendorScreen>   {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: BackgroundColor,
        key: _scaffoldKey,
        body: SafeArea(
          child: screen(),
        )
    );
  }


  Widget screen( ) {

    return Container(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: BackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.arrow_back,
                            color: MainHighlighter,
                            size: 25,
                          ),
                        )
                    ),
                   Container(
                     width: MediaQuery.of(context).size.width*0.6,
                     child: Text(
                       "Trusted Vendors",
                       maxLines: 1,
                       overflow: TextOverflow.visible,
                       textAlign: TextAlign.center,
                       style: TextStyle(color: MainHighlighter,
                         fontSize: 20.0,
                         fontFamily: "Header",
                         letterSpacing: 1.2,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   Container(),

                  ],
                ),
              )
          ),
          Expanded(
            flex: 10,
            child: widget.trustedVendors!=null?Container(
              child: TrustedDokanVendorGridView().getGridView(context, widget.trustedVendors, (){setState(() {});})
            ):Column(children:  [ProfileShimmer(),Divider(),ProfileShimmer()])
          )

        ],
      ),
    );
  }


}
