import 'package:flutter/material.dart';
import 'package:natural_energy/Utils/colors.dart';
import 'package:natural_energy/Utils/constant.dart';
import 'package:natural_energy/activity.dart';
import 'package:natural_energy/explore.dart';
import 'package:natural_energy/home.dart';
import 'package:natural_energy/product_list.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;

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
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Account"),
        actions: [Icon(Icons.edit), SizedBox(width: 5)],
      ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: appBarColor.withOpacity(0.2),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    //Profile pic
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/kid-home.jpg",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Iron Man",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "India",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.stars, color: appBarColor, size: 25),
                        Text(
                          "1500",
                          style: TextStyle(color: appBarColor, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 20.0, // soften the shadow
                          offset: Offset(0, 10),
                          // spreadRadius: 5.0, //extend the shadow
                          // offset: Offset(
                          //   5.0, // Move to right 10  horizontally
                          //   0.0, // Move to bottom 10 Vertically
                          // ),
                        ),
                      ]),
                      child: Column(
                        children: [
                          //phone no
                          Row(
                            children: [
                              Icon(Icons.phone_android),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "9123456789",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          //Birth date
                          Row(
                            children: [
                              Icon(Icons.cake),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "01-Jan-1997",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Date of Birth",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          //Email date
                          Row(
                            children: [
                              Icon(Icons.email),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ironman@gmail.com",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "E-mail",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          //Address
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#32, Tower 4, Star Residency, Cochin, India",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Local Address",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "About Me",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "The definition of a caption is a heading or title, or words on a screen that communicate what is being said. An example of a caption is the title of a magazine article. An example of a caption is a descriptive title under a photograph.",
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProfileTopWidget() {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            color: appBarColor.withOpacity(0.2),
            height: 125,
          ),
          Positioned(
            top: 125,
            bottom: 0,
            //left: MediaQuery.of(context).size.width * 0.5 - 50,
            child: Container(
              //color: Colors.white,
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 20.0, // soften the shadow
                  offset: Offset(0, 10),
                  // spreadRadius: 5.0, //extend the shadow
                  // offset: Offset(
                  //   5.0, // Move to right 10  horizontally
                  //   0.0, // Move to bottom 10 Vertically
                  // ),
                )
              ]),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text("aaaaaa"),
                    Text("aaaaaa"),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: MediaQuery.of(context).size.width * 0.5 - 50,
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/kid-home.jpg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Text("Cgirag")
        ],
      ),
    );
  }
}
