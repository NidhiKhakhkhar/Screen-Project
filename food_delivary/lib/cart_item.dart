import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary/home_page.dart';

class CartItems extends StatefulWidget {
  dynamic cartdata;

  CartItems(this.cartdata);

  @override
  State<CartItems> createState() => _CartItemsState();
}
//Text(widget.cartdata[0]['name'].toString()),



class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cart = widget.cartdata;
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
        child: Card(
            child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) => Column(
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
                            backgroundImage: AssetImage(cart[index]['url'])),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart[index]['name'],
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                               "\$"+ cart[index]['price'].toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  cart.remove(cart[index]);
                                  print(cart.length);
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
        )),
      ),
    );
  }
}
