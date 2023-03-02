import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary/home_page.dart';
import 'package:http/http.dart' as http;


class CartItems extends StatefulWidget {
  dynamic cartdata;

  CartItems(this.cartdata);

  @override
  State<CartItems> createState() => _CartItemsState();
}
//Text(widget.cartdata[0]['name'].toString()),

String cartUrl = "https://63f77f5ee8a73b486af98420.mockapi.io/cart_data";


class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> cart = widget.cartdata;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart Items",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: jsonDecode(snapshot.data!.body).length,
                    itemBuilder: (context, index) =>
                        Column(
                          children: [
                            Container(
                              child: Card(
                                elevation: 15,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/" + jsonDecode(
                                                  snapshot.data!.body
                                                      .toString())[index]['url'])),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              jsonDecode(snapshot.data!.body
                                                  .toString())[index]['name'],
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "\$" + jsonDecode(snapshot.data!
                                                  .body
                                                  .toString())[index]['price']
                                                  .toString(),
                                              style: TextStyle(fontSize: 15),
                                            ),

                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional
                                              .topEnd,
                                          child: InkWell(
                                            onTap: () {
                                                showDeleteAlert((jsonDecode(snapshot.data!.body.toString())[index]['id']));
                                                setState(() {

                                                });
                                            },
                                            child: Icon(Icons.close_rounded),
                                          ),
                                        ),
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
              future: getCartData(),
            )));
  }


  Future<http.Response> getCartData() async {
    var response = await http.get(Uri.parse(cartUrl));
    return response;
  }

  Future<http.Response> deleteFromCart(id) async {
    var response = await http.delete(Uri.parse(cartUrl + "/$id"));
    return response;
  }

  void showDeleteAlert(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Are you sure to remove from cart?"),
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () async {
                http.Response res = await deleteFromCart(id);
                if (res.statusCode == 200) {
                  setState(() {});
                }
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}