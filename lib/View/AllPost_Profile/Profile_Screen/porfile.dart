import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/Utils/appcontant.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  var data;

  Future<void> getUserData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      print("user id  ${AppConstant.currentUserID.toString()}");
      data = jsonDecode(response.body);
      print(data.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctx, index) {
                    return AppConstant.currentUserID == data[index]['id']
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(data[index]['name']),
                                ],
                              ),
                              Divider(thickness: 1.5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Username',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(data[index]['username'])
                                ],
                              ),
                              Divider(thickness: 1.5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text("Gwenborough"),
                                ],
                              ),
                              Divider(thickness: 1.5),
                    Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                    'Zip Code',
                    style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                    ),
                    Text("92998-3874"),
                            ],
                          )])
                        : SizedBox();
                  });
            }
          }),
    );
  }
}
