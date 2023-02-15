import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/material.dart';
import 'package:food_delivary/cart_item.dart';
import 'package:food_delivary/home_page.dart';
import 'package:food_delivary/main_screen_2.dart';
// import 'package:food_delivary/screen_3.dart';

class DetailedPage extends StatefulWidget {
  dynamic carddetail;
  DetailedPage(this.carddetail);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}


class _DetailedPageState extends State<DetailedPage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    late Size _size = MediaQuery.of(context).size;

    Map<String,dynamic> detail = widget.carddetail;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Icon(Icons.arrow_back),
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return Screen2();
                              },
                            ));
                          },
                        ),
                        Container(
                          child: GestureDetector(
                            onTap:  () {
                              setState(() {
                                detail['liked'] = !detail['liked'];
                              });
                            },
                            child: Icon( detail['liked'] ? Icons.favorite : Icons.favorite_outline_rounded , color: Colors.red,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: _size.width*0.8,
                    margin: EdgeInsets.only(top: 20),
                    child: Center(child: Image(image: AssetImage(detail['url']),)),

                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mcdonalds",
                          style: TextStyle(fontSize: 16),
                        ),
                        RatingBar.builder(
                          initialRating: detail['rating'],
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
                        Text(
                          // "\$47",
                          "\$${detail['price'].toString()}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      detail['name'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. ",
                      style: TextStyle(fontSize: 18),
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
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          "30 Mint",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    // color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  if(count > 0){
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
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrange),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return CartItems(cart);
                              },));
                              setState(() {

                               for (int i=1;i<=count;i++){
                                 cart.add(detail);
                               }
                              }) ;
                            },
                            child: Text(
                              "Add to cart",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
Widget CreateCarouselItem(image) {
  return Image(
    image: AssetImage(image),
    fit: BoxFit.cover,
  );
}