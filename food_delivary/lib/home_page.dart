// import 'dart:js';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivary/cart_item.dart';
import 'package:food_delivary/detailed_page.dart';
import 'package:food_delivary/insert_page.dart';
import 'package:http/http.dart' as http;
import 'package:food_delivary/empty.dart';
import 'package:food_delivary/main_screen_2.dart';

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

// List<Map<String, dynamic>> cart = [];
// int itemCount = cart.length;
late Size _size;

// bool _bold = false;

String apiUrl = "https://63f77f5ee8a73b486af98420.mockapi.io/Food_data";
String cartUrl = "https://63f77f5ee8a73b486af98420.mockapi.io/cart_data";

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> data = [];

  // List<Map<String, dynamic>> cart = [];
  // int itemCount = cart.length;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
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
                  child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    int cartLength =
                        jsonDecode(snapshot.data!.body.toString()).length;
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CartItems(jsonDecode(snapshot.data!.body));
                            },
                          ),
                        );
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
                          cartLength == 0
                              ? Container()
                              : Positioned(
                                  top: 4,
                                  right: 0,
                                  child: Container(
                                    height: 22,
                                    width: 22,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Center(
                                      child: Text(
                                        cartLength.toString(),
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    );

                  }
                  return Container();
                },
                future: getCartData(),
              )),
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
                width: double.infinity,
                height: _size.width * 0.7,
                child: FutureBuilder<http.Response>(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // var data1 = jsonDecode(snapshot.data!.body.toString());
                      return ListView.builder(
                        itemCount: jsonDecode(snapshot.data!.body).length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return DetailedPage((jsonDecode(
                                        snapshot.data!.body)[index]['id']));
                                  },
                                ));
                              },
                              child: Card(
                                elevation: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  width: _size.width * 0.45,
                                  height: _size.width * 0.7,
                                  // margin: EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                          onTap: () {
                                            updateFav(
                                                (jsonDecode(snapshot.data!.body
                                                    .toString())[index]['id']),
                                                !(jsonDecode(snapshot.data!.body
                                                        .toString())[index]
                                                    ['isFav']));
                                            setState(() {});
                                          },
                                          child: Icon(
                                            (jsonDecode(snapshot.data!.body
                                                            .toString())[index]
                                                        ['isFav']) ==
                                                    false
                                                ? Icons.favorite_outline_rounded
                                                : Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: _size.width * 0.3,
                                        height: _size.width * 0.3,
                                        child: Image.asset(
                                          "assets/images/" +
                                              (jsonDecode(snapshot.data!.body
                                                  .toString())[index]['url']),
                                          fit: BoxFit.contain,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          jsonDecode(snapshot.data!.body
                                              .toString())[index]['name'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: RatingBar.builder(
                                          initialRating: double.parse(
                                              jsonDecode(snapshot.data!.body
                                                      .toString())[index]
                                                  ['rating']),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "\$${jsonDecode(snapshot.data!.body.toString())[index]['price'].toString()}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: FloatingActionButton.small(
                                                onPressed: () {
                                                  // cart.add(jsonDecode(
                                                  //         snapshot
                                                  //             .data!.body
                                                  //             .toString())[
                                                  //     index]);
                                                  // setState(() {
                                                  //   itemCount += 1;
                                                  // });
                                                  addToCart(jsonDecode(snapshot
                                                      .data!.body)[index]);
                                                },
                                                child: Icon(Icons.add),
                                                backgroundColor:
                                                    Colors.deepOrangeAccent,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                  future: getDataFromServer(),
                ),
              ),
              // TextButton(
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) {
              //           return InsertAPI(null);
              //         },
              //       )).then((value) {
              //         if (value == true) {
              //           setState(() {});
              //         }
              //       });
              //     },
              //     child: Text("Add"))
            ]),
          ),
        ),
      ),
    );
  }

  // Widget Cards(
  //   int index,
  // ) {
  //   return Card(
  //     elevation: 10,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         color: Colors.white,
  //         // boxShadow: [
  //         //   BoxShadow(
  //         //       color: Colors.grey, blurRadius: 5, offset: const Offset(5, 5))
  //         // ],
  //       ),
  //       padding: EdgeInsets.all(8),
  //       width: _size.width * 0.45,
  //       height: _size.width * 0.7,
  //       // margin: EdgeInsets.only(right: 10),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           Container(
  //             alignment: Alignment.topRight,
  //             child: InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   data[index]['liked'] = !data[index]['liked'];
  //                 });
  //               },
  //               child: Icon(
  //                 data[index]['liked']
  //                     ? Icons.favorite
  //                     : Icons.favorite_outline_rounded,
  //                 color: Colors.red,
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             width: _size.width * 0.3,
  //             height: _size.width * 0.3,
  //             child: Image.asset(
  //               data[index]['url'],
  //               fit: BoxFit.contain,
  //               width: double.infinity,
  //               height: double.infinity,
  //             ),
  //           ),
  //           Align(
  //             alignment: Alignment.topLeft,
  //             child: Text(
  //               data[index]['name'],
  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //           Align(
  //             alignment: Alignment.topLeft,
  //             child: RatingBar.builder(
  //               initialRating: data[index]['rating'],
  //               minRating: 1,
  //               direction: Axis.horizontal,
  //               allowHalfRating: true,
  //               itemSize: 20,
  //               itemCount: 5,
  //               // itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
  //               itemBuilder: (context, _) => Icon(
  //                 Icons.star,
  //                 color: Colors.amber,
  //               ),
  //               onRatingUpdate: (rating) {
  //                 print(rating);
  //               },
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Text(
  //                   "\$${data[index]['price']}",
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               Align(
  //                   alignment: Alignment.topRight,
  //                   child: FloatingActionButton.small(
  //                     onPressed: () {
  //                       cart.add(data[index]);
  //                       setState(() {
  //                         itemCount += 1;
  //                       });
  //                     },
  //                     child: Icon(Icons.add),
  //                     backgroundColor: Colors.deepOrangeAccent,
  //                   ))
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

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

  Future<http.Response> getDataFromServer() async {
    var response = await http.get(Uri.parse(apiUrl));
    return response;
  }

  Future<http.Response> updateFav(id, value) async {
    Map<String, dynamic> map = {};
    map['isFav'] = value;
    print(value);
    var response = await http.put(Uri.parse(apiUrl + "/$id"),
        body: json.encode(map), headers: {"content-type": "application/json"});
    return response;
  }

  Future<void> addToCart(cartData) async {
    Map<String, dynamic> map = {};
    map['name'] = cartData['name'];
    map['url'] = cartData['url'];
    map['rating'] = cartData['rating'];
    map['price'] = cartData['price'];
    map['id'] =
    // map['itemCount'] += 1;
    var response = await http.post(Uri.parse(cartUrl), body: map);
    print(response);
  }

  Future<http.Response> getCartData() async {
    var response = await http.get(Uri.parse(cartUrl));
    return response;
  }
// void _likeUnlike(){
//   setState(() {
//     _liked = !_liked;
//   });
// }
}
