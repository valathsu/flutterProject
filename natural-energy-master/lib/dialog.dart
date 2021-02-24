import 'package:flutter/material.dart';
import 'package:natural_energy/Utils/colors.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: materialAppColor,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
                        SizedBox(height: 10,),
                        Text("Please wait, while we get your bonus points",style: TextStyle(color: Colors.white),)
                      ]),
                    )
                  ]));
        });
  }
}