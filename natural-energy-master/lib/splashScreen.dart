import 'dart:async';

import 'package:natural_energy/home.dart';

import 'Utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  State createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: SingleChildScrollView(
        //   child: loginPageBody(context),
        // ),
        child: loginPageBody(context),
      ),
    );
  }

  Widget loginPageBody(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/icon/icon.png",
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.width * 0.50,
            ),
          ),
        ],
      ),
    );
  }
}
