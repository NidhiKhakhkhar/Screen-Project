import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary/home_page.dart';
import 'package:http/http.dart' as http;


class InsertAPI extends StatefulWidget {
  Map? map;
   InsertAPI(this.map);

  @override
  State<InsertAPI> createState() => _InsertAPIState();
}

class _InsertAPIState extends State<InsertAPI> {
  var formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(),
      urlController = TextEditingController(),
      ratingController = TextEditingController(),
      priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
nameController.text = widget.map==null? '': widget.map!['name'];
    urlController.text = widget.map==null? '': widget.map!['url'];
    ratingController.text = widget.map==null? '': widget.map!['rating'];
    priceController.text = widget.map==null? '': widget.map!['price'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter Name"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter Valid Name";
                    }
                  },
                  controller: nameController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter url"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter Valid City";
                    }
                  },
                  controller: urlController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter rating"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter Valid Dob";
                    }
                  },
                  controller: ratingController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Enter price"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter Valid Dob";
                    }
                  },
                  controller: priceController,
                ),
                TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if(widget.map == null){
                          insertUser().then((value) => Navigator.of(context).pop(true));
                        }else{
                          updateUser(widget.map!['id']).then((value) => Navigator.of(context).pop(true));
                        }
                      }
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> insertUser() async {
    Map map = {};
    map['name'] = nameController.text;
    map['url'] = urlController.text;
    map['rating'] = ratingController.text;
    map['price'] = priceController.text;

    var response1 = await http.post(Uri.parse(apiUrl), body: json.encode(map),headers: {"content-type": "application/json"});
    print(response1.body);
  }

  Future<void> updateUser(id) async {
    Map map = {};
    map['name'] = nameController.text;
    map['url'] = urlController.text;
    map['rating'] = ratingController.text;
    map['price'] = priceController.text;

    var response1 = await http.post(Uri.parse(apiUrl+ "/$id"), body: json.encode(map),headers: {"content-type": "application/json"});
    print(response1.body);
  }
}
