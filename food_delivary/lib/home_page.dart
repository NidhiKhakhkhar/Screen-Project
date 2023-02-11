// import 'dart:js';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivary/cart_item.dart';
import 'package:food_delivary/detailed_page.dart';
import 'package:food_delivary/empty.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String url = 'assets/images/';

// class Data {
//   List<Map<String, dynamic>> data = [
//     {
//       "name": 'Burgers',
//       "url": url + 'burger2.avif',
//       "rating": 4.0,
//       "price": 47,
//       "liked": false
//     },
//     {
//       "name": 'Italian food ',
//       "url": url + 'italian.png',
//       "rating": 4.0,
//       "price": 50,
//       "liked": false
//     },
//     {
//       "name": 'Sizzlers',
//       "url": url + 'sizzler.jpg',
//       "rating": 4.0,
//       "price": 60,
//       "liked": false
//     },
//     {
//       "name": 'South-Indian',
//       "url": url + 'south_indian.jpeg',
//       "rating": 3.0,
//       "price": 57,
//       "liked": false
//     },
//     {
//       "name": 'Punjabi',
//       "url": url + 'punjabi.jpeg',
//       "rating": 4.0,
//       "price": 45,
//       "liked": false
//     },
//     {
//       "name": 'Chaat',
//       "url": url + 'chaat.jpeg',
//       "rating": 4.0,
//       "price": 30,
//       "liked": false
//     },
//     {
//       "name": 'Deserts',
//       "url": url + 'desert.jpeg',
//       "rating": 4.0,
//       "price": 60,
//       "liked": false
//     },
//     {
//       "name": 'Beverages',
//       "url": url + 'softdrinks.jpeg',
//       "rating": 3.0,
//       "price": 35,
//       "liked": false
//     },
//   ];
// }

List<Map<String, dynamic>> cart = [];
int itemCount = cart.length;
late Size _size;

// bool _bold = false;

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    Map<String, dynamic> map = {};
    map['name'] = "Burgurs";
    map['url'] = "assets/images/burger2.avif";
    map['rating'] = 4.0;
    map['price'] = 47;
    map['liked'] = false;
    data.add(map);

    map = {};
    map['name'] = "Italian food";
    map['url'] = "assets/images/italian.png";
    map['rating'] = 4.0;
    map['price'] = 50;
    map['liked'] = false;
    data.add(map);

    map = {};
    map['name'] = "Sizzlers";
    map['url'] = "assets/images/sizzler.jpg";
    map['rating'] = 4.0;
    map['price'] = 60;
    map['liked'] = false;
    data.add(map);

    map = {};
    map['name'] = "South-Indian";
    map['url'] = "assets/images/south_indian.jpeg";
    map['rating'] = 4.0;
    map['price'] = 57;
    map['liked'] = false;
    data.add(map);

    map = {};
    map['name'] = "Punjabi";
    map['url'] = "assets/images/punjabi.jpeg";
    map['rating'] = 4.0;
    map['price'] = 45;
    map['liked'] = false;
    data.add(map);

    map = {};
    map['name'] = "Chaat";
    map['url'] = "assets/images/chaat.jpeg";
    map['rating'] = 4.0;
    map['price'] = 30;
    map['liked'] = false;
    data.add(map);

    map = {};
    map['name'] = "Deserts";
    map['url'] = "assets/images/desert.jpeg";
    map['rating'] = 4.0;
    map['price'] = 60;
    map['liked'] = false;
    data.add(map);

    map = {};
    map['name'] = "Beverages";
    map['url'] = "assets/images/softdrinks.jpeg";
    map['rating'] = 4.0;
    map['price'] = 35;
    map['liked'] = false;
    data.add(map);

    super.initState();
  }

  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrangeAccent,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ));
              },
              icon: Icon(
                Icons.home_outlined,
                color: Colors.deepOrangeAccent,
                size: 30,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: NavigationIcon(icon:  Icon(
                Icons.explore_outlined,
                size: 30,
              ),),
              label: ""),
          BottomNavigationBarItem(
              icon: NavigationIcon(icon: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3126/3126504.png",
                width: 40,
              ),),
              // icon: Icon(Icons.qr_code_scanner),
              label: ""),
          BottomNavigationBarItem(
            icon: NavigationIcon(icon: Image.network(
              "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS1xW5OM-JVwufBprYmQoLTxLwGi4jfQQHE79V3wNtGOmiO9u0y",
              width: 30,
            ),),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: NavigationIcon(icon: Transform.rotate(
                  angle: pi * 0.2,
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                  )),),
              label: ""),
        ],
      ),
      appBar: AppBar(
        title: Container(
          child: Text(
            "HOME ",
            style: TextStyle(color: Colors.black),
          ),
          alignment: Alignment.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              margin: EdgeInsets.only(right: 5),
              height: _size.width * 0.2,
              width: _size.width * 0.12,
              // color: Colors.redAccent,
              child: GestureDetector(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CartItems(cart);
                      },
                    ));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                        ),
                      ),
                      cart.length == 0
                          ? Container()
                          : Positioned(
                              top: 4,
                              right: 0,
                              child: Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Center(
                                  child: Text(
                                    cart.length.toString(),
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Container(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(children: [
              Row(
                children: [
                  Flexible(
                    child: TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search",
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.black87),
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              Container(
                height: _size.height * 0.1,
                margin: EdgeInsets.only(top: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Cont(name: "Pizza"),
                    Cont(name: "Burger"),
                    Cont(name: "Drinks"),
                    Cont(name: "Sauces"),
                    Cont(name: "Combo")
                  ],
                ),
              ),
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/banner.jpg",
                    )),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [Cards(), Cards()],
              // ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: _size.width * 0.7,
                  child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return DetailedPage(data[index]);
                                  },
                                ));
                              },
                              child: Cards(index)),
                        ]),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget Cards(
    int index,
  ) {
    return Card(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey, blurRadius: 5, offset: const Offset(5, 5))
          // ],
        ),
        padding: EdgeInsets.all(8),
        width: _size.width * 0.45,
        height: _size.width * 0.7,
        // margin: EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  setState(() {
                    data[index]['liked'] = !data[index]['liked'];
                  });
                },
                child: Icon(
                  data[index]['liked']
                      ? Icons.favorite
                      : Icons.favorite_outline_rounded,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              width: _size.width * 0.3,
              height: _size.width * 0.3,
              child: Image.asset(
                data[index]['url'],
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                data[index]['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: RatingBar.builder(
                initialRating: data[index]['rating'],
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 20,
                itemCount: 5,
                // itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\$${data[index]['price']}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: FloatingActionButton.small(
                      onPressed: () {
                        cart.add(data[index]);
                        setState(() {
                          itemCount += 1;
                        });
                      },
                      child: Icon(Icons.add),
                      backgroundColor: Colors.deepOrangeAccent,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget NavigationIcon({icon}) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return Empty();
            },
          ));
        },
        icon: icon);
  }

  Widget Cont({name}) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Text(
          "$name",
          style: TextStyle(fontSize: 20),
        ),
        margin: EdgeInsets.only(
          top: 20,
          right: 50,
        ),
      ),
    );
  }

// void _likeUnlike(){
//   setState(() {
//     _liked = !_liked;
//   });
// }
}
