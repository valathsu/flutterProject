import 'package:flutter/material.dart';
import 'package:natural_energy/Utils/colors.dart';
import 'package:natural_energy/Utils/constant.dart';
import 'package:natural_energy/explore.dart';
import 'package:natural_energy/home.dart';
import 'package:natural_energy/product_list.dart';
import 'package:natural_energy/profile.dart';
import 'app_bar_widget.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  int _selectedIndex = 3;

  List<dynamic> activitys = [
    {
      "Text": "BIM-4 bottle",
      "Qty": "1",
      "Date": "20-Jan-2020",
      "Points": "30",
    },
    {
      "Text": "BIM-1 bottle",
      "Qty": "2",
      "Date": "15-Jan-2020",
      "Points": "30",
    },
    {
      "Text": "BIM-2 bottle",
      "Qty": "2",
      "Date": "05-Jan-2020",
      "Points": "20",
    },
    {
      "Text": "BIM-1 bottle",
      "Qty": "4",
      "Date": "01-Jan-2020",
      "Points": "30",
    },
  ];

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
        child: ListView.separated(
          separatorBuilder: (BuildContext bcx, int index) {
            return Text("");
          },
          itemCount: activitys.length,
          itemBuilder: (BuildContext bcx, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: new BoxDecoration(
                        color: appBarColor.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(
                        activitys[index]["Points"].toString(),
                      )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 2,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'You purchased'),
                                  TextSpan(
                                      text: ' ' +
                                          activitys[index]["Qty"].toString() +
                                          ' ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: activitys[index]["Text"]),
                                ],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              activitys[index]["Date"],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'Points Rewarded: '),
                                  TextSpan(
                                      text: activitys[index]["Points"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: appBarColor)),
                                ],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            //Text("Points Rewarded : " + activitys[index]["Points"]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
