import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorem_ipsum/Utils/appcontant.dart';
import 'package:provider/provider.dart';

import '../../../Provider/allpostprovider.dart';

class AllPostScreen extends StatefulWidget {
  const AllPostScreen({Key? key}) : super(key: key);

  @override
  State<AllPostScreen> createState() => _AllPostScreenState();
}

class _AllPostScreenState extends State<AllPostScreen> {
  var data;

  Future<void> getUserData() async {
    final response =
    // https://api.chucknorris.io/jokes/categories
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print(data.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              data[index]['title'],style: TextStyle(color: AppConstant.currentUserID == data[index]['id'] ?  Color(0xffAF0917) :  Colors.black , fontWeight: AppConstant.currentUserID == data[index]['id'] ? FontWeight.bold : FontWeight.normal),
                            ),
                            subtitle: Text(
                                data[index]['body']),
                            textColor: Colors.black,
                            tileColor: Colors.black26,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }
          });
  }
}
