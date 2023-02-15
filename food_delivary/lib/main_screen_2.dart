import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary/empty.dart';
import 'package:food_delivary/home_page.dart';
import 'dart:math';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

int selectedIndex = 0;
List<Widget> widgetList = [HomePage(), Empty(), Empty(), Empty(), Empty()];

class _Screen2State extends State<Screen2> {
  @override
void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: widgetList[selectedIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrangeAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.deepOrangeAccent,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore_outlined,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/3126/3126504.png",
                  width: 40,
                ),
                // icon: Icon(Icons.qr_code_scanner),
                label: ""),
            BottomNavigationBarItem(
              icon: Image.network(
                "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS1xW5OM-JVwufBprYmQoLTxLwGi4jfQQHE79V3wNtGOmiO9u0y",
                width: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Transform.rotate(
                  angle: pi * 0.2,
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 30,
                  ),
                ),
                label: ""),
          ],
          // unselectedItemColor: Colors.deepOrangeAccent,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }


}
