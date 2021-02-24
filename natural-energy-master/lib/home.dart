import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:natural_energy/activity.dart';
import 'package:natural_energy/app_bar_widget.dart';
import 'package:natural_energy/explore.dart';
import 'package:natural_energy/profile.dart';
import 'package:natural_energy/product_list.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Utils/colors.dart';
import 'Utils/constant.dart';
import "package:flutter/material.dart";
import 'product_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  Product p = Product("", "", "");
  int _currentIndex = 0;
  //int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
    }
    if (index == 2) {
      Navigator.push(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getOfferCard(),
              SizedBox(height: 20),
              KidImageWidget(),
              SizedBox(height: 20),
              HotOfferWidget(),
              SizedBox(
                height: 20,
              ),
              NewProductCarouselWidget(),
              SizedBox(
                height: 10,
              ),
              ProjectsWidget(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getOfferCard() {
    return Card(
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
    );
  }

  Widget KidImageWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: appBarColor, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 7.0, // soften the shadow
            //spreadRadius: 1.0, //extend the shadow
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _image != null
              ? Image.file(
                  _image,
                  fit: BoxFit.contain,
                  height: 220,
                  //width: double.infinity,
                )
              : Image.asset(
                  "assets/images/kid-home-3.jpg",
                  fit: BoxFit.contain,
                  height: 220,
                  //width: double.infinity,
                ),
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              size: 30,
            ),
            onPressed: () {
              _showPicker(context);
            },
          ),
        ],
      ),
    );
  }

  Widget HotOfferWidget() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "Hot Offer",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListPage()),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                "assets/images/hot-offer.jpg",
                fit: BoxFit.fill,
                height: 200,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget NewProductCarouselWidget() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "New Products",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              CarouselSlider(
                items: p
                    .getProducts()
                    .map(
                      (e) => GestureDetector(
                        child: FadeInImage.assetNetwork(
                          placeholder: e.image,
                          image: e.image ?? e.name ?? '',
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListPage()),
                          );
                        },
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  autoPlay: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 3.0,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool isSelected = index == _currentIndex;
                      return Container(
                        width: 10.0,
                        color: Theme.of(context).primaryColor,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 3.0,
                    ),
                    itemCount: p.getProducts().length,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget ProjectsWidget() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "Latest Blogs",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              final url = "https://toastguyz.com/blog";
              if (await canLaunch(url) != null) {
                await launch(url);
              } else {
                throw 'Could not Launch $url';
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                "assets/images/projects.jpg",
                fit: BoxFit.fill,
                //height: 300,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
