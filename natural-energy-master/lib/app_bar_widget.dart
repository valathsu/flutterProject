import 'package:flutter/material.dart';
import 'Utils/colors.dart';
import 'package:natural_energy/Utils/constant.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(    
           child: Container(
             color: Colors.white,
             width: 100,
             height: 100,
            child: Image.asset(              
              "assets/icon/icon.png",
              fit: BoxFit.contain,
            ),
          ),),),
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text(
        APP_NAME,
        style: TextStyle(color: Colors.white),
      ),
   /*    actions: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Icon(Icons.add_shopping_cart),
          ),
        ),
      ], */
    );
  }
}
