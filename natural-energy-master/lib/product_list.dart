import 'package:flutter/material.dart';
import 'package:natural_energy/Utils/colors.dart';
import 'package:natural_energy/Utils/constant.dart';
import 'package:natural_energy/activity.dart';
import 'package:natural_energy/explore.dart';
import 'package:natural_energy/home.dart';
import 'package:natural_energy/product_data.dart';
import 'package:natural_energy/profile.dart';
import 'app_bar_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int _selectedIndex = 1;
  var products = Product("", "", "").getProducts();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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

  void viewProductImageDialog(Product item) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      item.image,
                      height: 300,
                    ),
                    // CachedNetworkImage(
                    //   imageUrl: item.image,
                    //   placeholder: (context, url) =>
                    //       imageLoadingControl(125, 125),
                    //   width: 125,
                    //   height: 125,
                    // ),
                  ],
                ),
              ),
            ));
  }

  Widget _productListWidget() {
    return Container(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        separatorBuilder: (BuildContext bc, int index) {
          return Divider(
            height: 5,
          );
        },
        itemBuilder: (BuildContext bc, int index) {
          return Card(
            child: Padding(
              padding: index == 0
                  ? const EdgeInsets.only(top: 20)
                  : const EdgeInsets.all(0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      viewProductImageDialog(products[index]);
                    },
                    child: Image.asset(
                      products[index].image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 130,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              products[index].name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: List<Widget>.generate(5, (inx) {
                                    return Icon(Icons.star,
                                        size: 20,
                                        color: inx < products[index].rating
                                            ? Colors.amber
                                            : Colors.grey);
                                  }),
                                ),
                                Text(
                                  "(" +
                                      products[index].totalRating.toString() +
                                      " Rating)",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          products[index].description,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        SizedBox(height: 10),
                        Row(
                          //alignment: WrapAlignment.center,
                          //direction: Axis.horizontal,
                          //alignment: WrapAlignment.spaceBetween,
                          //crossAxisAlignment: WrapCrossAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "\u20B9" +
                                            products[index].price.toString() +
                                            " "),
                                    TextSpan(
                                        text: "\u20B9" +
                                            products[index].MRP.toString(),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ],
                                  style: TextStyle(
                                    color: appBarColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            FlatButton.icon(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: appBarColor,
                              ),
                              label: Text(
                                "Add to Cart",
                                style: TextStyle(color: appBarColor),
                              ),
                              onPressed: () {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                    products[index].name + "  Added to cart",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

  Widget _getBody(BuildContext context) {
    final scrollController = ScrollController();

    return Container(
        child: CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: _getOfferCard(),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 250,
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Mockup01.png',
                    fit: BoxFit.fitHeight,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Naturals Energy BIM 1',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The power to stay healthy',
                        style: TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Only \u20B9" + "128.37" + " ",
                                style: TextStyle(
                                    fontSize: 20, fontStyle: FontStyle.italic),
                              ),
                              TextSpan(
                                text: "MRP. \u20B9" + "273.10",
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                            style: TextStyle(
                              color: appBarColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          Row(
                            children: List<Widget>.generate(5, (inx) {
                              return Icon(Icons.star,
                                  size: 20,
                                  color: inx < 4 ? Colors.amber : Colors.grey);
                            }),
                          ),
                          Text('(283 Reviews)')
                        ],
                      )
                    ],
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 250,
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Mockup01.png',
                    fit: BoxFit.fitHeight,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Naturals Energy BIM 2',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The power to stay healthy',
                        style: TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Only \u20B9" + "99.99" + " ",
                                style: TextStyle(
                                    fontSize: 20, fontStyle: FontStyle.italic),
                              ),
                              TextSpan(
                                text: "MRP. \u20B9" + "199.10",
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                            style: TextStyle(
                              color: appBarColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          Row(
                            children: List<Widget>.generate(5, (inx) {
                              return Icon(Icons.star,
                                  size: 20,
                                  color: inx < 4 ? Colors.amber : Colors.grey);
                            }),
                          ),
                          Text('(283 Reviews)')
                        ],
                      )
                    ],
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
        body: _getBody(context)
        /* ListView.separated(
          itemCount: products.length,
          separatorBuilder: (BuildContext bc, int index) {
            return Divider(
              height: 5,
            );
          },
          itemBuilder: (BuildContext bc, int index) {
            return Card(
              child: Padding(
                padding: index == 0
                    ? const EdgeInsets.only(top: 20)
                    : const EdgeInsets.all(0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        viewProductImageDialog(products[index]);
                      },
                      child: Image.asset(
                        products[index].image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 130,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                products[index].name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: List<Widget>.generate(5, (inx) {
                                      return Icon(Icons.star,
                                          size: 20,
                                          color: inx < products[index].rating
                                              ? Colors.amber
                                              : Colors.grey);
                                    }),
                                  ),
                                  Text(
                                    "(" +
                                        products[index].totalRating.toString() +
                                        " Rating)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            products[index].description,
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                          SizedBox(height: 10),
                          Row(
                            //alignment: WrapAlignment.center,
                            //direction: Axis.horizontal,
                            //alignment: WrapAlignment.spaceBetween,
                            //crossAxisAlignment: WrapCrossAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "\u20B9" +
                                              products[index].price.toString() +
                                              " "),
                                      TextSpan(
                                          text: "\u20B9" +
                                              products[index].MRP.toString(),
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                    ],
                                    style: TextStyle(
                                      color: appBarColor,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              FlatButton.icon(
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: appBarColor,
                                ),
                                label: Text(
                                  "Add to Cart",
                                  style: TextStyle(color: appBarColor),
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      products[index].name + "  Added to cart",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ), */

        );
  }
}
