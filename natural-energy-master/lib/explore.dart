import 'package:flutter/material.dart';
import 'package:natural_energy/Utils/colors.dart';
import 'package:natural_energy/Utils/constant.dart';
import 'package:natural_energy/activity.dart';
import 'package:natural_energy/home.dart';
import 'package:natural_energy/product_list.dart';
import 'package:natural_energy/profile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';
import 'dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'app_bar_widget.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'M9zUnY9m-eQ',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool bShowResult = false;
  bool bScanError = false;
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
    }
    if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ExplorePage()),
      );
    }
    if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ActivityPage()),
      );
    }
    if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  Future _scan() async {
    bScanError = false;
    bShowResult = false;
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
      bScanError = true;
    } else {
      print("Barcode" + barcode);
      _postData();
    }
  }

  _postData() {
    Dialogs.showLoadingDialog(context, _keyLoader);

    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

      setState(() {
        bShowResult = true;
      });
    });
  }

  Widget _youTubeVideo() {
    return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: appBarColor,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bShowResult ? _youTubeVideo() : Container(),
              bShowResult
                  ? Container()
                  : Center(
                      child: Card(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: CircularPercentIndicator(
                                radius: 100.0,
                                lineWidth: 10.0,
                                percent: 0.8,
                                header: new Text(
                                  "",
                                  style: TextStyle(color: Colors.white),
                                ),
                                center: new Icon(
                                  Icons.card_giftcard,
                                  size: 50.0,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.redAccent,
                                progressColor: Colors.yellowAccent,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Be rewarded at every 2K points",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.white,
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        color: appBarColor,
                      ),
                    ),
              bShowResult && !bScanError
                  ? Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: double.infinity, minHeight: 70.0),
                        child: Container(                        
                        margin: EdgeInsets.only(top: 30.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.green[100],
                              blurRadius: 30.0,
                            ),
                          ],
                        ),
                        child: Card(
                          color: Colors.green[200],
                          child: Text(                            
                            "You got 100 points. Thank you.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: appBarColor,
                                fontSize: 25.0,
                                fontFamily: "Vedana"),
                          ),
                        ),
                      ),),
                    )
                  : Text(""),
              SizedBox(
                height: 20,
              ),
              bScanError
                  ? Center(
                      child: Text(
                      "Error in scanning QR Code",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25.0,
                          fontFamily: "Vedana"),
                    ))
                  : Text(""),
              Center(
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: _scan,
                  child: Image.asset(
                    'assets/images/tapme.jpg',
                    width: 200,
                  ),
                ),
              ),
              //Center(child:Text("Scan QR Code & get bonus points", style: TextStyle(color: appBarColor, fontSize: 20.0) ,),),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
