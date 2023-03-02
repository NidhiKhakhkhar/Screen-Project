import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/material.dart';
import 'package:food_delivary/cart_item.dart';
import 'package:food_delivary/home_page.dart';
import 'package:http/http.dart' as http;

import 'package:food_delivary/main_screen_2.dart';
// import 'package:food_delivary/screen_3.dart';

class DetailedPage extends StatefulWidget {
  String id;

  DetailedPage(this.id);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

String cartUrl = "https://63f77f5ee8a73b486af98420.mockapi.io/cart_data";
String apiUrl = "https://63f77f5ee8a73b486af98420.mockapi.io/Food_data";


class _DetailedPageState extends State<DetailedPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    late Size _size = MediaQuery
        .of(context)
        .size;


    return Scaffold(
      appBar: AppBar(title: Text("Detail Page",style: TextStyle(color: Colors.black),),),
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.hasData){
          return Container(
            // color: Colors.red,
            padding: EdgeInsets.all(20),
            child: Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 10),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                              jsonDecode(snapshot.data!.body)['isFav']
                                  ? Icons.favorite
                                  : Icons.favorite_outline_rounded,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    height: _size.width * 0.8,
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                        child: Image(
                          image: AssetImage("assets/images/" + jsonDecode(snapshot.data!.body.toString())['url']),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mcdonalds",
                          style: TextStyle(fontSize: 16),
                        ),
                        RatingBar.builder(
                          initialRating: double.parse(jsonDecode(snapshot.data!.body)['rating']),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 20,
                          itemCount: 5,
                          // itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) =>
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          // "\$47",
                          "\$${jsonDecode(snapshot.data!.body.toString())['price'].toString()}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                     jsonDecode(snapshot.data!.body.toString())['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Delivery time : ",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          "30 Mint",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        // color: Colors.red,
                        height: _size.width * 0.2,
                        // margin: EdgeInsets.only(top: 50),
                        // color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton.small(
                                  onPressed: () {
                                    setState(() {
                                      if (count > 0) {
                                        count -= 1;
                                      }
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                  backgroundColor: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("$count"),
                                ),
                                FloatingActionButton.small(
                                  onPressed: () {
                                    setState(() {
                                      count += 1;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                  backgroundColor: Colors.deepOrange,
                                ),
                              ],
                            ),
                            Container(
                              // padding: EdgeInsets.symmetric(horizontal: 50),
                              width: _size.width * 0.5,
                              height: _size.width * 0.15,
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange),
                              child: TextButton(
                                onPressed: () {
                                  for(int i=1;i<=count;i++){
                                    addToCart((jsonDecode(snapshot.data!.body)));
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
      future: getById(widget.id),
      )
    );
  }


  Future<http.Response> updateFav(id, value) async {
    Map<String, dynamic> map = {};
    map['isFav'] = value;
    print(value);
    var response = await http.put(Uri.parse(apiUrl + "/$id"),
        body: json.encode(map), headers: {"content-type": "application/json"});
    return response;
  }

  Widget CreateCarouselItem(image) {
    return Image(
      image: AssetImage(image),
      fit: BoxFit.cover,
    );
  }

  Future<void> addToCart(cartData) async {
    Map<String, dynamic> map = {};
    map['name'] = cartData['name'];
    map['url'] = cartData['url'];
    map['rating'] = cartData['rating'];
    map['price'] = cartData['price'];
    var response = await http.post(Uri.parse(cartUrl), body: map);
    print(response);
  }

  Future<http.Response> getById(id) async {
    var response = await http.get(Uri.parse(apiUrl+"/$id"));
    return response;
  }
}