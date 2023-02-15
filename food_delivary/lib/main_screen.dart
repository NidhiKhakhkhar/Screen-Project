import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary/home_page.dart';
import 'package:food_delivary/main_screen_2.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/chief.webp"),
              margin: EdgeInsets.only(top: 40),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text(
                "The Fastest \nFood Delivery",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(

                child: TextButton(
  
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                  return Screen2();
                },));
              },
              child: Text("Get Started",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),

            ),
            // color: Colors.deepOrangeAccent,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.deepOrangeAccent),

            )
          ],
        ),
      ),
    );
  }
}
